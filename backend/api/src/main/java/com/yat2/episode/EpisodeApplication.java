package com.yat2.episode;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.boot.persistence.autoconfigure.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EntityScan(basePackages = {"com.yat2.episode"})
@ConfigurationPropertiesScan("com.yat2.episode")
public class EpisodeApplication {

	public static void main(String[] args) {
		SpringApplication.run(EpisodeApplication.class, args);
	}

}
