package com.yat2.episode.api.question;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.yat2.episode.api.competency.CompetencyType;
import com.yat2.episode.api.global.exception.CustomException;
import com.yat2.episode.api.global.exception.ErrorCode;
import com.yat2.episode.api.question.dto.QuestionSummaryDto;
import com.yat2.episode.api.question.dto.QuestionsByCompetencyCategoryDto;
import com.yat2.episode.api.user.User;
import com.yat2.episode.api.user.UserService;

@RequiredArgsConstructor
@Service
public class QuestionService {
    private final QuestionRepository questionRepository;
    private final UserService userService;

    @Transactional(readOnly = true)
    public List<QuestionsByCompetencyCategoryDto> getQuestionSetByUserId(long userId) {
        User user = userService.getUserOrThrow(userId);

        if (user.getJob() == null) {
            throw new CustomException(ErrorCode.JOB_NOT_SELECTED);
        }

        List<Question> questions = questionRepository.findAllWithCompetencyByJobId(user.getJob().getId());

        Map<CompetencyType.Category, List<Question>> questionsByCategory =
                questions.stream().collect(Collectors.groupingBy(q -> q.getCompetencyType().getCategory()));

        return questionsByCategory.entrySet().stream().sorted(Map.Entry.comparingByKey()).map(entry -> {
            CompetencyType.Category category = entry.getKey();
            List<QuestionSummaryDto> questionDtos = entry.getValue().stream().map(QuestionSummaryDto::of).toList();

            return new QuestionsByCompetencyCategoryDto(category, questionDtos);
        }).toList();
    }
}
