package com.tanby.springcloud.swagger.controller;

import com.tanby.springcloud.swagger.model.AppInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tanbinyuan
 * @date 2019/12/13
 */
@RestController
public class TestController {

    @GetMapping("/getName")
    public String getName(String id){
        return String.format("测试%s", id);
    }

    @PostMapping("/save")
    public String saveApp(AppInfo appInfo) {
        appInfo.setId("1");
        return appInfo.getId();
    }
}
