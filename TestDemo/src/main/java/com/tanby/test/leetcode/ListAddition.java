package com.tanby.test.leetcode;

/**
 * @author tanbinyuan
 * @date 2021/4/8
 */
public class ListAddition {

    public static void main(String[] args) {
        ListNode a1 = new ListNode(2);
        ListNode a2 = new ListNode(4);
        ListNode a3 = new ListNode(3);

        a1.next = a2;
        a2.next = a3;

        ListNode b1 = new ListNode(5);
        ListNode b2 = new ListNode(6);
        ListNode b3 = new ListNode(4);
        b1.next = b2;
        b2.next = b3;

        System.out.println(addTwoNumber(a1, b1));
    }

    public static ListNode addTwoNumber(ListNode a, ListNode b) {
        ListNode head = null;
        ListNode tail = null;
        int carry  = 0;

        while (a != null || b != null) {
            int n = a != null ? a.value : 0;
            int m = b != null ? b.value : 0;

            int addResult = n + m + carry;
            carry = addResult / 10;
            if (head == null) {
                head = tail = new ListNode(addResult % 10);
            } else {
                tail.next = new ListNode(addResult % 10);
                tail = tail.next;
            }

            if (a != null) {
                a = a.next;
            }

            if (b != null) {
                b = b.next;
            }
        }

        if (carry > 0) {
            tail.next = new ListNode(carry);
        }

        return head;
    }

    static class ListNode {
        private int value;
        private ListNode next;

        public ListNode() {

        }

        public ListNode(int value) {
            this.value = value;
        }

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(value);
            ListNode temp = next;
            while (temp != null) {
                sb.append(",");
                sb.append(temp.value);
                temp = temp.next;
            }
            sb.append("]");
            return sb.toString();
        }
    }
}
