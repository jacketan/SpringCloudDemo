package com.tanby.springcloud.stream.messaging;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.SubscribableChannel;

public interface StudyConsumer {

    String CONSUMER = "consumer";

    @Input(StudyConsumer.CONSUMER)
    SubscribableChannel consumer();
}
