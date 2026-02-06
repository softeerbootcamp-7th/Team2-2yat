package com.yat2.episode.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.boot.persistence.autoconfigure.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = { "com.yat2.episode.api" })
@ConfigurationPropertiesScan("com.yat2.episode.api")
public class EpisodeApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(EpisodeApiApplication.class, args);
    }

}
