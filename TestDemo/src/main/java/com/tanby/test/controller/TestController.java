package com.tanby.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tanbinyuan
 * @date 2020/7/31
 */
@RestController
public class TestController {

    @RequestMapping("/test")
    public String test() {
        return "ok";
    }
}
