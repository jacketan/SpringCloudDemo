package com.tanby.springcloud.swagger.test;

import com.google.common.collect.Maps;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

public class Test {

    private static final String hh = "160948728";
    private static final String name = "小海";
    private static final String boy = "同皆无穷";

    public static void main(String[] args) throws Exception {
        final AtomicInteger topic = new AtomicInteger(200000);
        for(;;) {
            CountDownLatch countDownLatch = new CountDownLatch(10);
            for (int i = 0; i < 10; i++ ) {
                ThreadPoolUtil.run(() -> {
                    run(countDownLatch, topic.get());
                    topic.addAndGet(1);
                });
            }
            countDownLatch.await();
            if (topic.get() > 300000) {
                ThreadPoolUtil.shutdown();
                break;
            }
        }


    }

    private static void run(CountDownLatch countDownLatch, int topic) {
        try {
            int start = 0;
            int count = 500;
            int total;
            Map<String, String> headers = Maps.newHashMap();
            headers.put("Origin", "https://www.douban.com");
            headers.put("Referer", "https://www.douban.com/gallery/topic/"+topic+"/?sort=new");
            headers.put("Sec-Fetch-Mode", "cors");
            headers.put("Content-Type", "application/x-www-form-urlencoded");

            do {
                HttpResponse<JsonNode> response = Unirest.get("https://m.douban.com/rexxar/api/v2/gallery/topic/"+topic+"/items?sort=new&start=" + start + "&count=" + count + "&status_full_text=1&guest_only=0&ck=7DBF")
                        .headers(headers)
                        .asJson();
                if (response.getStatus() != 200) {
                    break;
                }
                JsonNode body = response.getBody();
                JSONObject data = body.getObject();
                total = data.getInt("total");
                JSONArray items = data.getJSONArray("items");

                for (int i = 0; i < items.length(); i++) {
                    JSONObject object = items.getJSONObject(i);
                    JSONObject target = object.optJSONObject("target");
                    JSONObject status = target.optJSONObject("status");
                    JSONArray comments = target.optJSONArray("comments");;
                    JSONObject author;
                    if (status != null) {
                        author = status.optJSONObject("author");
                    } else {
                        author = target.optJSONObject("author");
                    }
                    analysis(author, start, topic);
                    if (comments != null && comments.length() > 0) {
                        for (int j = 0; j < comments.length(); j++) {
                            analysis(comments.getJSONObject(j).optJSONObject("author"), start, topic);
                        }
                    }
                }

                start = start + count;
            } while (start < total);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            countDownLatch.countDown();
        }
    }

    private static void analysis(JSONObject author, int start, int topic) throws JSONException {
        String authorName = author.getString("name");
        String uid = author.getString("uid");
        if (hh.equals(uid) || name.equalsIgnoreCase(authorName) || boy.equalsIgnoreCase(authorName)) {
            System.out.println(authorName + ";" + uid + ";topic:" + topic);
            System.out.println("【找到用户了:】" + author.toString());
            System.out.println("start:" + start);
        }
    }
}
