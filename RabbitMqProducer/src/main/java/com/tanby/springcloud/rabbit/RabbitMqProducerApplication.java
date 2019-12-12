package com.tanby.springcloud.rabbit;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author tanbinyuan
 * @date 2019/11/28
 */
@SpringCloudApplication
public class RabbitMqProducerApplication {

    public static void main(String[] args) {
        SpringApplication.run(RabbitMqProducerApplication.class, args);
    }
}
