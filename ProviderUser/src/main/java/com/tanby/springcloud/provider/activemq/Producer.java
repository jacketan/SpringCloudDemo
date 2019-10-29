package com.tanby.springcloud.provider.activemq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class Producer {

    @Autowired
    private JmsTemplate jmsTemplate;

    @Scheduled(fixedDelay = 3000)
    public void sendMessage() {
        jmsTemplate.convertAndSend("my-test", "测试消息队列：" + System.currentTimeMillis() / 1000);
    }

}
