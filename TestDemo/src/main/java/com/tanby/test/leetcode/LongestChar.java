package com.tanby.test.leetcode;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author tanbinyuan
 * @date 2021/4/9
 */
public class LongestChar {

    public static void main(String[] args) {
        String test = "abcabcbb";
        System.out.println(getLongest(test));
        System.out.println(lengthOfLongestSubstring(test));
    }

    public static int getLongest(String str) {
        int count = 0;
        List<Character> continueList = new ArrayList<>();

        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (continueList.contains(c)) {
                if (continueList.size() > count) {
                    count = continueList.size();
                }
                int index = continueList.indexOf(c);
                if (index == continueList.size() - 1) {
                    continueList = new ArrayList<>();
                } else {
                    continueList = continueList.subList(index + 1, continueList.size());
                }
            }
            continueList.add(c);
        }

        return count;
    }

    private static int lengthOfLongestSubstring(String s) {
        int n = s.length();
        int rk = 0;
        int ans = 0;
        Set<Character> occ = new HashSet<>();

        for (int i = 0; i < n; i++) {
            if (i != 0) {
                occ.remove(s.charAt(i - 1));
            }

            while (rk < n && !occ.contains(s.charAt(rk))) {
                occ.add(s.charAt(rk));
                rk++;
            }

            ans = Math.max(ans, rk - i);
        }

        return ans;
    }
}
