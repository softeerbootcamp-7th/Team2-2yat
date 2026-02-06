package com.yat2.episode.api.mindmap.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record MindmapNameUpdateReqDto(
        @NotBlank(message = "이름은 공백일 수 없습니다.") @Size(max = 43, message = "이름은 43자 이내여야 합니다.") String name
) {}
