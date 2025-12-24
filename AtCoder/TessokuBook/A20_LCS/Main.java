import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題

*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String str1 = sc.next();
		String str2 = sc.next();

		int[][] subMaxLens = new int[str1.length() + 1][str2.length() + 1];

		// 片方の文字サイズが0の場合は必ず、部分文字列の最大長は0。
		for (int i1 = 0; i1 <= str1.length(); i1++) {
			subMaxLens[i1][0] = 0;
		}
		for (int i2 = 0; i2 <= str2.length(); i2++) {
			subMaxLens[0][i2] = 0;
		}

		for (int i1 = 1; i1 <= str1.length(); i1++) {
			for (int i2 = 1; i2 <= str2.length(); i2++) {
				if (str1.charAt(i1 - 1) == str2.charAt(i2 - 1)) {
					subMaxLens[i1][i2] = subMaxLens[i1 - 1][i2 - 1] + 1;
				} else {
					subMaxLens[i1][i2] = Math.max(subMaxLens[i1 - 1][i2], subMaxLens[i1][i2 - 1]);
				}
			}
		}
		System.out.println(subMaxLens[str1.length()][str2.length()]);
	}

}
