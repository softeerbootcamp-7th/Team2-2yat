package com.yat2.episode.mindmap.s3;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@ConfigurationProperties(prefix = "aws.s3")
public class S3Properties {
    private String region;
    private String endpoint;
    private String accessKey;
    private String secretKey;

    private long maxUploadSize = 10485760L;

    private Bucket bucket = new Bucket();

    @Getter
    @Setter
    public static class Bucket {
        private String name;
    }
}
