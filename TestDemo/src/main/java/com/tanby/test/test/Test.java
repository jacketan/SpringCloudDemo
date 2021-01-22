package com.tanby.test.test;

import lombok.Data;

import java.util.Arrays;
import java.util.List;
import java.util.function.BinaryOperator;
import java.util.stream.Stream;

/**
 * @author tanbinyuan
 * @date 2020/8/24
 */
public class Test {

    public static void main(String[] args) {
        List<Track> tracks = Arrays.asList(new Track("谭彬源", 18),
                new Track("李四", 26),
                new Track("张三", 29));

        Integer reduce = Stream.of(1, 2, 3).reduce(2, (acc, element) -> acc + element);
        System.out.println(reduce);
        BinaryOperator<Integer> b = (a1, a2) -> a1 + a2;
    }

    @Data
    public static class Track{
        private String name;

        private int age;

        Track(String name, int age) {
            this.name = name;
            this.age = age;
        }
    }
}
