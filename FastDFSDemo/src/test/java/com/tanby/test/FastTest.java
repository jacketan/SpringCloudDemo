package com.tanby.test;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import com.github.tobato.fastdfs.domain.fdfs.MetaData;
import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.upload.FastImageFile;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import com.tanby.fastdfs.FastDFSApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.BufferedInputStream;
import java.io.File;
import java.util.HashSet;
import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = FastDFSApplication.class)
public class FastTest {

    @Autowired
    private FastFileStorageClient fileStorageClient;

    @Test
    public void test() {
        File file = FileUtil.file("C:\\Users\\谭彬愿\\Desktop\\test.jpg");
        BufferedInputStream in = FileUtil.getInputStream(file);
        String extName = FileUtil.getType(file);
        Set<MetaData> metaData = new HashSet<>();

        StorePath storePath = fileStorageClient.uploadFile(in, file.length(), extName, createMetaData(file));
        System.out.println(storePath.getFullPath());
        System.out.println(storePath.getPath());
        System.out.println(storePath.getGroup());
    }

    @Test
    public void testMetadata() {
        StorePath storePath = StorePath.parseFromUrl("group1/M00/00/00/wKgBBV8OZsCASJWLAABtOFo72hQ3.jpg");
        Set<MetaData> metadata = fileStorageClient.getMetadata(storePath.getGroup(), storePath.getPath());
        System.out.println(metadata);
    }

    private Set<MetaData> createMetaData(File file) {
        Set<MetaData> metaDataSet = new HashSet<>();
        metaDataSet.add(new MetaData("Author", "tanbinyuan"));
        metaDataSet.add(new MetaData("CreateDate", DateUtil.now()));
        metaDataSet.add(new MetaData("fileName", file.getAbsolutePath()));
        metaDataSet.add(new MetaData("fileType", FileUtil.getType(file)));
        return metaDataSet;
    }
}
