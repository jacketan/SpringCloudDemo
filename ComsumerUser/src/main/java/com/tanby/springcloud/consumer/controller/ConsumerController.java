package com.tanby.springcloud.consumer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ConsumerController {

    @Autowired
    public RestTemplate restTemplate;

    @RequestMapping("/service")
    public String service() {
        ResponseEntity<String> entity = restTemplate.getForEntity("http://EUREKACLIENT/hello", String.class);
        return entity.getBody();
    }
}
