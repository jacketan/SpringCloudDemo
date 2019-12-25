package com.tanby.springcloud.stream.provider.impl;

import com.tanby.springcloud.stream.provider.IMessageProvider;
import com.tanby.springcloud.stream.vo.Company;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.MessageBuilder;

import javax.annotation.Resource;

/**
 * @author tanbinyuan
 * @date 2019/12/25
 */
@EnableBinding(Source.class)
public class MessageProviderImpl implements IMessageProvider {

    @Resource
    private MessageChannel output;

    @Override
    public void send(Company company) {
        this.output.send(MessageBuilder.withPayload(company).build());
    }
}
