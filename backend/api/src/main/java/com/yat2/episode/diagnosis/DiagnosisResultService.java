package com.yat2.episode.diagnosis;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class DiagnosisResultService {
    private final DiagnosisResultRepository diagnosisResultRepository;

}
