package com.tanby.springcloud.rabbit.service;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.MessagePostProcessor;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author tanbinyuan
 * @date 2019/11/28
 */
@Service
public class ProducerService {

    @Resource
    private AmqpTemplate amqpTemplate;

    public void send() {
       /* MessagePostProcessor messagePostProcessor = message -> {
            MessageProperties messageProperties = message.getMessageProperties();
            // 设置编码
            messageProperties.setContentEncoding("utf-8");
            // 设置过期时间10*1000毫秒
            messageProperties.setExpiration("10000");
            return message;
        };*/
        amqpTemplate.convertAndSend("DL_EXCHANGE","DL_KEY", "你好，tanby1");
//        amqpTemplate.convertAndSend("key2", "你好，tanby2");
    }
}
