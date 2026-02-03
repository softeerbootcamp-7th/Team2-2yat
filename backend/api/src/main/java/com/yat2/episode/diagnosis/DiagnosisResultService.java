package com.yat2.episode.diagnosis;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

import com.yat2.episode.diagnosis.dto.DiagnosisArgsReqDto;
import com.yat2.episode.diagnosis.dto.DiagnosisSimpleNoDateDto;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.question.Question;
import com.yat2.episode.question.QuestionRepository;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

@RequiredArgsConstructor
@Service
public class DiagnosisResultService {
    private final DiagnosisResultRepository diagnosisResultRepository;
    private final DiagnosisWeaknessRepository diagnosisWeaknessRepository;
    private final QuestionRepository questionRepository;
    private final UserService userService;

    @Transactional
    public DiagnosisSimpleNoDateDto createDiagnosis(Long userId, DiagnosisArgsReqDto reqDto) {
        User user = userService.getUserOrThrow(userId);
        if (user.getJob() == null) throw new CustomException(ErrorCode.JOB_NOT_SELECTED);
        DiagnosisResult diagnosisResult =
                diagnosisResultRepository.save(DiagnosisResult.newDiagnosis(user, user.getJob()));
        for (Integer questionId : reqDto.unansweredQuestionIds()) {
            Question question = questionRepository.findById(questionId)
                    .orElseThrow(() -> new CustomException(ErrorCode.QUESTION_NOT_FOUND));
            diagnosisWeaknessRepository.save(DiagnosisWeakness.newDiagnosisWeakness(diagnosisResult, question));
        }

        return DiagnosisSimpleNoDateDto.of(diagnosisResult, reqDto.unansweredQuestionIds().size());
    }

    public URI getCreatedURI(Integer diagnosisId) {
        return ServletUriComponentsBuilder.fromCurrentRequest().path("/{diagnosisId}").buildAndExpand(diagnosisId)
                .toUri();
    }
}
