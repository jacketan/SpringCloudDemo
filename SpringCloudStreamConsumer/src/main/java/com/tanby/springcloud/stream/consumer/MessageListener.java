package com.tanby.springcloud.stream.consumer;

import com.tanby.springcloud.stream.vo.Company;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;

/**
 * @author tanbinyuan
 * @date 2019/12/25
 */
@EnableBinding(Sink.class)
public class MessageListener {

    @StreamListener(Sink.INPUT)
    public void input(Company company) {
        System.out.println(String.format("接收到的消息：%s", company));
    }
}
