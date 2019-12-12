package com.tanby.springcloud.rabbit.service;

import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * @author tanbinyuan
 * @date 2019/11/28
 */
@Service
public class Consumer {

    @RabbitListener(queues = "REDIRECT_QUEUE")
    public void test4(Channel channel, Message message, String msg) throws IOException {
        System.out.println(String.format("-----------接收的消息：%s-----", msg));
//        channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
    }

    @RabbitListener(queues = "DL_QUEUE")
    public void test5(Channel channel, Message message, String msg) throws IOException {
        System.out.println(String.format("-----------接收的消息：%s-----", msg));
        channel.basicNack(message.getMessageProperties().getDeliveryTag(),false, false);
    }
}
