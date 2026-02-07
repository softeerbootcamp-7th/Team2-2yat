package com.yat2.episode.utils;

import org.springframework.test.util.ReflectionTestUtils;
import java.lang.reflect.Constructor;

public class TestEntityFactory {

    public static <T> T createEntity(Class<T> clazz) {
        try {
            Constructor<T> constructor = clazz.getDeclaredConstructor();
            constructor.setAccessible(true);
            return constructor.newInstance();
        } catch (Exception e) {
            throw new RuntimeException("테스트 엔티티 생성 실패: " + clazz.getSimpleName(), e);
        }
    }
}