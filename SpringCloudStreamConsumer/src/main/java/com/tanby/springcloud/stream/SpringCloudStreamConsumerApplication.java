package com.tanby.springcloud.stream;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author tanbinyuan
 * @date 2019/12/25
 */
@SpringCloudApplication
public class SpringCloudStreamConsumerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudStreamConsumerApplication.class, args);
    }
}
