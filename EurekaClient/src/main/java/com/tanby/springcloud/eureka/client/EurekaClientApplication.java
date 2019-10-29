package com.tanby.springcloud.eureka.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaClient
@RestController
public class EurekaClientApplication {

    @Autowired
    private DiscoveryClient client;

    @RequestMapping("/test/{id}")
    public String test(@PathVariable("id") String id) {
        return "Hello :" + id;
    }

    @RequestMapping("/hello")
    public String service() {
        client.getServices().forEach(service -> {
            System.out.println(service);
        });
        return "Hello World!";
    }

    public static void main(String[] args) {
        SpringApplication.run(EurekaClientApplication.class, args);
    }
}
