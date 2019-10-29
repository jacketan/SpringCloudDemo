package com.tanby.springcloud.provider.controller;


import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;
import com.tanby.springcloud.provider.entity.User;
import com.tanby.springcloud.provider.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EurekaClient eurekaClient;

    @GetMapping("/getUserById/{id}")
    public User findById(@PathVariable("id") Long id) {
        return userRepository.getOne(id);
    }

    @GetMapping("/serviceUrl")
    public String serviceUrl() {
        InstanceInfo providerUser = eurekaClient.getNextServerFromEureka("ProviderUser", true);

        return providerUser.getHomePageUrl();
    }
}
