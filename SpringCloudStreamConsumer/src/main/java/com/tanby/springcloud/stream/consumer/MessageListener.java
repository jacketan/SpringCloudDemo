package com.tanby.springcloud.stream.consumer;

import com.tanby.springcloud.stream.messaging.StudyConsumer;
import com.tanby.springcloud.stream.vo.Company;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;

/**
 * @author tanbinyuan
 * @date 2019/12/25
 */
@EnableBinding({Sink.class, StudyConsumer.class})
public class MessageListener {

    @StreamListener(Sink.INPUT)
    public void input(Company company) {
        System.out.println(String.format("input接收到的消息：%s", company));
    }

    @StreamListener(StudyConsumer.CONSUMER)
    public void consumer(Company company) {
        System.out.println(String.format("consumer接收到的消息：%s", company));
    }
}
