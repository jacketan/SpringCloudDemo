package com.tanby.springcloud.test;

import com.tanby.springcloud.rabbit.RabbitMqProducerApplication;
import com.tanby.springcloud.rabbit.service.ProducerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author tanbinyuan
 * @date 2019/11/28
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = RabbitMqProducerApplication.class)
public class RabbitTest {

    @Resource
    private ProducerService producerService;

    @Test
    public void test() {
        producerService.send();
    }
}
