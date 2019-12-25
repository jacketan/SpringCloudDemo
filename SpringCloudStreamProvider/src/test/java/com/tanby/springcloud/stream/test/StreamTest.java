package com.tanby.springcloud.stream.test;

import com.tanby.springcloud.stream.SpringCloudStreamApplication;
import com.tanby.springcloud.stream.provider.IMessageProvider;
import com.tanby.springcloud.stream.vo.Company;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author tanbinyuan
 * @date 2019/12/25
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = SpringCloudStreamApplication.class)
public class StreamTest {

    @Resource
    private IMessageProvider provider;

    @Test
    public void test() {
        Company company = new Company();
        company.setTitle("stream test");
        company.setNote("notes");
        provider.send(company);
    }

}
