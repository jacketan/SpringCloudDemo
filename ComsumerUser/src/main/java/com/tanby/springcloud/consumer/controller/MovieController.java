package com.tanby.springcloud.consumer.controller;

import com.tanby.springcloud.consumer.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class MovieController {

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/getUserById/{id}")
    public User getUserById(@PathVariable("id") Long id) {
        ResponseEntity<User> forEntity = restTemplate.getForEntity("http://localhost:7900/getUserById/" + id, User.class);
        return forEntity.getBody();
    }
}
