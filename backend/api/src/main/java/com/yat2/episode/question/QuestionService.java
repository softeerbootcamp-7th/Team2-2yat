package com.yat2.episode.question;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.global.exception.CustomException;
import com.yat2.episode.global.exception.ErrorCode;
import com.yat2.episode.question.dto.CategoryGroupResponseDto;
import com.yat2.episode.question.dto.SimpleQuestionDto;
import com.yat2.episode.user.User;
import com.yat2.episode.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class QuestionService {
    private final QuestionRepository questionRepository;
    private final UserService userService;

    @Transactional(readOnly = true)
    public List<CategoryGroupResponseDto> getQuestionSetByUserId(long userId){
        User user = userService.getUserOrThrow(userId);

        if (user.getJob() == null) {
            throw new CustomException(ErrorCode.JOB_NOT_SELECTED);
        }

        List<Question> questions = questionRepository.findAllWithCompetencyByJobId(user.getJob().getId());

        Map<CompetencyType.Category, List<Question>> questionsByCategory = questions.stream()
                .collect(Collectors.groupingBy(q -> q.getCompetencyType().getCategory()));

        return questionsByCategory.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .map(entry -> {
                    CompetencyType.Category category = entry.getKey();
                    List<SimpleQuestionDto> questionDtos = entry.getValue().stream()
                            .map(SimpleQuestionDto::of)
                            .toList();

                    return new CategoryGroupResponseDto(category, questionDtos);
                })
                .toList();
    }
}
