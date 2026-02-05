package com.yat2.episode.diagnosis;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import com.yat2.episode.diagnosis.dto.DiagnosisArgsReqDto;
import com.yat2.episode.diagnosis.dto.DiagnosisSimpleDto;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.question.Question;
import com.yat2.episode.question.QuestionRepository;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class DiagnosisResultService {
    private final DiagnosisResultRepository diagnosisResultRepository;
    private final DiagnosisWeaknessRepository diagnosisWeaknessRepository;
    private final QuestionRepository questionRepository;
    private final UserService userService;

    @Transactional
    public DiagnosisSimpleDto createDiagnosis(Long userId, DiagnosisArgsReqDto reqDto) {
        User user = userService.getUserOrThrow(userId);
        validateUserJob(user);

        List<Question> questions = questionRepository.findAllById(reqDto.unansweredQuestionIds());
        if (questions.size() != reqDto.unansweredQuestionIds().size()) {
            throw new CustomException(ErrorCode.QUESTION_NOT_FOUND);
        }

        DiagnosisResult diagnosisResult = diagnosisResultRepository.save(new DiagnosisResult(user, user.getJob()));

        List<DiagnosisWeakness> weaknesses =
                questions.stream().map(q -> new DiagnosisWeakness(diagnosisResult, q)).toList();
        diagnosisWeaknessRepository.saveAll(weaknesses);
        //todo: save-all을 통한 개별 쿼리에서 bulk 방식으로 개선

        return DiagnosisSimpleDto.of(diagnosisResult, weaknesses.size());
    }

    private void validateUserJob(User user) {
        if (user.getJob() == null) {
            throw new CustomException(ErrorCode.JOB_NOT_SELECTED);
        }
    }
}
