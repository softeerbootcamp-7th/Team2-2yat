package com.yat2.episode.global.utils;

import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

public final class UriUtil {
    private UriUtil() {}

    public static URI createLocationUri(Object id) {
        return ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(id).toUri();
    }
}
