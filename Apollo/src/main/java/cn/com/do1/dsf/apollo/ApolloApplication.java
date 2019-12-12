package cn.com.do1.dsf.apollo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tanbinyuan
 * @date 2019/11/1
 */
@SpringCloudApplication
public class ApolloApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApolloApplication.class, args);
    }

    @RestController
    class Test {

        @Value("${server.tomcat.uri-encoding:}")
        private String name;

        @Value("${spring.datasource.druid.first.url:}")
        private String datasourceUrl;

        @GetMapping("/getName")
        public String getName() {
            return datasourceUrl;
        }
    }
}
