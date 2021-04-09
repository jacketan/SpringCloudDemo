package com.tanby.test.test;

import cn.hutool.core.text.UnicodeUtil;
import com.tanby.test.leetcode.ListAddition;
import lombok.Data;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.function.BinaryOperator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

/**
 * @author tanbinyuan
 * @date 2020/8/24
 */
public class Test {

    private static final String formatSpecifier
            = "%(\\d+\\$)?([-#+ 0,(\\<]*)?(\\d+)?(\\.\\d+)?([tT])?([a-zA-Z%])";

    private static Pattern fsPattern = Pattern.compile(formatSpecifier);

    public static void main(String[] args) {

    }

    private static void test(int count) {
        if (count < 1) {
            return;
        }
        int[][] s = new int[count][count];
        for (int i = 0; i < count; i++) {
            for (int j = 0; j <= i; j++) {
                if (j == 0) {
                    s[i][j] = 1;
                } else {
                    int total = 0;
                    for (int a = 0; a < i; a++) {
                        total += s[a][j-1];
                    }
                    s[i][j] = total;
                }
                if (s[i][j] != 0) {
                    System.out.printf(String.format("%4d", s[i][j]));
                }
            }
            System.out.println();
        }

    }

    public static String unicodeToStr(String unicode) {
        StringBuilder sb = new StringBuilder();
        String[] unicodes = unicode.split("\\\\u");
        for (int i = 1; i < unicodes.length; i++) {
            int v = Integer.parseInt(unicodes[i], 16);
            sb.append((char) v);
        }
        return sb.toString();
    }

    public static String strToUnicode(String str) {
        StringBuilder sb = new StringBuilder();
        char[] chars = str.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            String s = Integer.toHexString(chars[i]);
            sb.append("\\u");
            for (int y = 4; y > s.length(); y--) {
                sb.append("0");
            }
            sb.append(s.toUpperCase());
        }
        return sb.toString();
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
