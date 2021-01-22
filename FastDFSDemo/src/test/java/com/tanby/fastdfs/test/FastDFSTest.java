package com.tanby.fastdfs.test;

import cn.hutool.core.io.FileUtil;
import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import com.tanby.fastdfs.FastDFSApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.BufferedInputStream;
import java.io.File;

/**
 * @author tanbinyuan
 * @date 2020/7/16
 */

@RunWith(SpringRunner.class)
@SpringBootTest(classes = FastDFSApplication.class)
public class FastDFSTest {

    @Autowired
    private FastFileStorageClient fileStorageClient;

    @Test
    public void test() {
        File file = FileUtil.file("C:\\Users\\11264\\Pictures\\火车票\\谭彬源-20190802-深圳北到长沙南-388.5元.jpg");
        BufferedInputStream is = FileUtil.getInputStream(file);
        String extName = FileUtil.getType(file);
        long length = file.length();

        StorePath storePath = fileStorageClient.uploadFile(is, length, extName, null);
        System.out.println(storePath.getFullPath());
    }
}
