package com.tanby.springcloud.stream.provider;

import com.tanby.springcloud.stream.vo.Company;

public interface IMessageProvider {

    public void send(Company company);
}
