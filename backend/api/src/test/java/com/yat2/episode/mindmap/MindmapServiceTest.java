package com.yat2.episode.mindmap;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.mindmap.constants.MindmapConstants;
import com.yat2.episode.mindmap.dto.MindmapArgsReqDto;
import com.yat2.episode.mindmap.dto.MindmapDataDto;
import com.yat2.episode.mindmap.dto.MindmapDataExceptDateDto;
import com.yat2.episode.mindmap.s3.S3ObjectKeyGenerator;
import com.yat2.episode.mindmap.s3.S3SnapshotRepository;
import com.yat2.episode.mindmap.s3.dto.S3UploadResponseDto;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
@DisplayName("MindmapService 단위 테스트")
class MindmapServiceTest {

    @Mock
    private MindmapRepository mindmapRepository;
    @Mock
    private MindmapParticipantRepository mindmapParticipantRepository;
    @Mock
    private S3SnapshotRepository snapshotRepository;
    @Mock
    private UserService userService;
    @Mock
    private S3ObjectKeyGenerator s3ObjectKeyGenerator;

    @InjectMocks
    private MindmapService mindmapService;

    private User testUser;
    private final long testUserId = 1L;

    @BeforeEach
    void setUp() {
        testUser = User.newUser(testUserId, "애플");
    }

    @Nested
    @DisplayName("saveMindmapAndParticipant")
    class SaveMindmapAndParticipant {

        @Test
        @DisplayName("팀 마인드맵 생성 시 제목이 없으면 MINDMAP_TITLE_REQUIRED 예외가 발생한다")
        void should_throw_exception_when_shared_mindmap_has_no_title() {
            MindmapArgsReqDto req = new MindmapArgsReqDto(true, ""); // shared=true, title=""
            given(userService.getUserOrThrow(testUserId)).willReturn(testUser);

            assertThatThrownBy(
                    () -> mindmapService.saveMindmapAndParticipant(testUserId, req, UUID.randomUUID())).isInstanceOf(
                            CustomException.class).extracting(e -> ((CustomException) e).getErrorCode())
                    .isEqualTo(ErrorCode.MINDMAP_TITLE_REQUIRED);
        }

        @Test
        @DisplayName("개인 마인드맵 생성 시 제목이 없으면 중복을 피해 순차적인 이름을 생성한다")
        void should_generate_sequential_name_for_private_mindmap() {
            MindmapArgsReqDto req = new MindmapArgsReqDto(false, null);
            UUID mindmapId = UUID.randomUUID();
            String baseName = "애플" + MindmapConstants.PRIVATE_NAME;

            given(userService.getUserOrThrow(testUserId)).willReturn(testUser);
            given(mindmapRepository.findAllNamesByBaseName(baseName, testUserId)).willReturn(
                    List.of(baseName, baseName + "(1)"));

            MindmapDataExceptDateDto result = mindmapService.saveMindmapAndParticipant(testUserId, req, mindmapId);

            assertThat(result.mindmapName()).isEqualTo(baseName + "(2)");
            verify(mindmapRepository).save(any(Mindmap.class));
            verify(mindmapParticipantRepository).save(any(MindmapParticipant.class));
        }
    }

    @Nested
    @DisplayName("deleteMindmap")
    class DeleteMindmap {

        @Test
        @DisplayName("마지막 참여자가 마인드맵을 삭제하면 실제 마인드맵 엔티티도 삭제된다")
        void should_delete_mindmap_entity_when_no_participants_left() {
            UUID mindmapUUID = UUID.randomUUID();
            Mindmap mindmap = new Mindmap(mindmapUUID, "삭제될 마인드맵", false);

            given(mindmapRepository.findByIdWithLock(mindmapUUID)).willReturn(Optional.of(mindmap));
            given(mindmapParticipantRepository.deleteByMindmap_IdAndUser_KakaoId(mindmapUUID, testUserId)).willReturn(
                    1);
            given(mindmapParticipantRepository.existsByMindmap_Id(mindmapUUID)).willReturn(false);

            mindmapService.deleteMindmap(testUserId, mindmapUUID.toString());

            verify(mindmapRepository).delete(mindmap);
        }

        @Test
        @DisplayName("다른 참여자가 남아있으면 참여 정보만 삭제되고 마인드맵 엔티티는 유지된다")
        void should_only_delete_participant_when_others_remain() {
            UUID mindmapUUID = UUID.randomUUID();
            Mindmap mindmap = new Mindmap(mindmapUUID, "유지될 마인드맵", true);

            given(mindmapRepository.findByIdWithLock(mindmapUUID)).willReturn(Optional.of(mindmap));
            given(mindmapParticipantRepository.deleteByMindmap_IdAndUser_KakaoId(mindmapUUID, testUserId)).willReturn(
                    1);
            given(mindmapParticipantRepository.existsByMindmap_Id(mindmapUUID)).willReturn(true);

            mindmapService.deleteMindmap(testUserId, mindmapUUID.toString());

            verify(mindmapRepository, never()).delete(any());
        }
    }

    @Nested
    @DisplayName("updateName")
    class UpdateName {

        @Test
        @DisplayName("마인드맵의 이름을 성공적으로 변경한다")
        void should_update_mindmap_name() {
            UUID mindmapUUID = UUID.randomUUID();
            Mindmap mindmap = new Mindmap(mindmapUUID, "이전 이름", false);
            MindmapParticipant participant = new MindmapParticipant(testUser, mindmap);

            given(mindmapParticipantRepository.findByMindmapIdAndUserId(mindmapUUID, testUserId)).willReturn(
                    Optional.of(participant));

            MindmapDataDto result = mindmapService.updateName(testUserId, mindmapUUID.toString(), "새 이름");

            assertThat(result.mindmapName()).isEqualTo("새 이름");
            assertThat(mindmap.getName()).isEqualTo("새 이름");
        }
    }

    @Nested
    @DisplayName("getUploadInfo")
    class GetUploadInfo {

        @Test
        @DisplayName("S3 업로드를 위한 Presigned URL 정보를 반환한다")
        void should_return_s3_upload_info() {
            UUID mindmapId = UUID.randomUUID();
            String objectKey = "mindmaps/" + mindmapId;
            S3UploadResponseDto expectedResponse = mock(S3UploadResponseDto.class);

            given(s3ObjectKeyGenerator.generateMindmapSnapshotKey(mindmapId)).willReturn(objectKey);
            given(snapshotRepository.createPresignedUploadInfo(objectKey)).willReturn(expectedResponse);

            S3UploadResponseDto result = mindmapService.getUploadInfo(mindmapId);

            assertThat(result).isEqualTo(expectedResponse);
            verify(snapshotRepository).createPresignedUploadInfo(objectKey);
        }
    }
}