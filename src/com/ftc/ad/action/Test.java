package com.ftc.ad.action;

public class Test {
	public static void main(String[] args) {
		test(10, 20);
	}
	
	public static void test(int cur,int total) {
		int show=10;
		int i=1;
		while (cur-i > 0 && i <= show/2) {
			System.out.println(i);
			i++;
		}
		show=show-i;
		
		System.out.println(cur);
	}
}
