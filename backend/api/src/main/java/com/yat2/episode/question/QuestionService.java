package com.yat2.episode.question;

import com.yat2.episode.competency.CompetencyType;
import com.yat2.episode.question.dto.SimpleQuestionDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class QuestionService {
    private final QuestionRepository questionRepository;

    public List<SimpleQuestionDto> getQuestionSet(){
        return getRandomOnePerCompetency().stream().map(SimpleQuestionDto::of).toList();
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
