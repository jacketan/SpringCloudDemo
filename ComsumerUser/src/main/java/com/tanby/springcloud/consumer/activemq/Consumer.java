package com.tanby.springcloud.consumer.activemq;

import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

@Component
public class Consumer {

    @JmsListener(destination = "my-test")
    public void receive(String msg) {
        System.out.println(msg);
    }
}
