package com.yat2.episode.diagnosis;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import com.yat2.episode.diagnosis.dto.DiagnosisArgsReqDto;
import com.yat2.episode.diagnosis.dto.DiagnosisDetailDto;
import com.yat2.episode.diagnosis.dto.DiagnosisSummaryDto;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.question.Question;
import com.yat2.episode.question.QuestionRepository;
import com.yat2.episode.question.dto.QuestionDetailDto;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class DiagnosisService {
    private final DiagnosisRepository diagnosisRepository;
    private final DiagnosisWeaknessRepository diagnosisWeaknessRepository;
    private final QuestionRepository questionRepository;
    private final UserService userService;

    @Transactional
    public DiagnosisSummaryDto createDiagnosis(Long userId, DiagnosisArgsReqDto reqDto) {
        User user = userService.getUserOrThrow(userId);
        validateUserJob(user);

        List<Question> questions = questionRepository.findAllById(reqDto.unansweredQuestionIds());
        if (questions.size() != reqDto.unansweredQuestionIds().size()) {
            throw new CustomException(ErrorCode.QUESTION_NOT_FOUND);
        }

        DiagnosisResult diagnosisResult = diagnosisRepository.save(new DiagnosisResult(user, user.getJob()));

        List<DiagnosisWeakness> weaknesses =
                questions.stream().map(q -> new DiagnosisWeakness(diagnosisResult, q)).toList();
        diagnosisWeaknessRepository.saveAll(weaknesses);
        //todo: save-all을 통한 개별 쿼리에서 bulk 방식으로 개선

        return DiagnosisSummaryDto.of(diagnosisResult, weaknesses.size());
    }

    public List<DiagnosisSummaryDto> getDiagnosisSummariesByUserId(Long userId) {
        return diagnosisRepository.findDiagnosisSummariesByUserId(userId);
    }

    public DiagnosisDetailDto getDiagnosisDetailById(Integer diagnosisId, Long userId) {
        DiagnosisResult diagnosis = diagnosisRepository.findDetailByIdAndUserId(diagnosisId, userId)
                .orElseThrow(() -> new CustomException(ErrorCode.DIAGNOSIS_NOT_FOUND));

        List<QuestionDetailDto> weaknesses =
                diagnosis.getWeaknesses().stream().map(DiagnosisWeakness::getQuestion).map(QuestionDetailDto::of)
                        .toList();

        return new DiagnosisDetailDto(diagnosis.getId(), diagnosis.getJob().getName(), diagnosis.getCreatedAt(),
                                      weaknesses);
    }

    private void validateUserJob(User user) {
        if (user.getJob() == null) {
            throw new CustomException(ErrorCode.JOB_NOT_SELECTED);
        }
    }
}
