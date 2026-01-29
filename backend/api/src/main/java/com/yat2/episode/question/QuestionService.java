package com.yat2.episode.question;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.question.dto.CategoryGroupResponseDto;
import com.yat2.episode.question.dto.SimpleQuestionDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class QuestionService {
    private final QuestionRepository questionRepository;

    @Transactional(readOnly = true)
    public List<CategoryGroupResponseDto> getQuestionSet(){
        List<Question> selectedQuestions = getRandomOnePerCompetency();
        Map<CompetencyType.Category, List<Question>> questionsByCategory = selectedQuestions.stream()
                .collect(Collectors.groupingBy(q -> q.getCompetencyType().getCategory()));

        return questionsByCategory.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .map(entry -> {
                    CompetencyType.Category category = entry.getKey();
                    List<Question> questions = entry.getValue();

                    List<SimpleQuestionDto> questionDtos = questions.stream()
                            .map(SimpleQuestionDto::of)
                            .toList();

                    return new CategoryGroupResponseDto(category, questionDtos);
                })
                .toList();
    }

    private List<Question> getRandomOnePerCompetency() {
        List<Question> allQuestions = questionRepository.findAllWithCompetency();

        Map<CompetencyType, List<Question>> questionsByCompetency = allQuestions.stream()
                .collect(Collectors.groupingBy(Question::getCompetencyType));

        List<Question> selectedQuestions = new ArrayList<>();
        Random random = new Random();

        for (CompetencyType type : questionsByCompetency.keySet()) {
            List<Question> questions = questionsByCompetency.get(type);
            if (!questions.isEmpty()) {
                int randomIndex = random.nextInt(questions.size());
                selectedQuestions.add(questions.get(randomIndex));
            }
        }

        return selectedQuestions;
    }
}
