package com.yat2.episode.diagnosis;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/diagnosis")
@Tag(name = "Diagnosis", description = "마인드맵 관리 API")
public class DiagnosisResultController {
    private final DiagnosisResultService diagnosisResultService;
}
