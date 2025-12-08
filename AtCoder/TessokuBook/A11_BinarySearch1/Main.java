import java.util.*;

/*
  二分探索法を使用して解く問題。
*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntNums = sc.nextInt();
		int targetNum = sc.nextInt();
		int[] nums = new int[cntNums];
		for (int i = 0; i < cntNums; i++) {
			nums[i] = sc.nextInt();
		}

		// 問題文より、前提条件としてnumsは小さい順にソート済み。
		// 制約より、numsの要素はユニークな値になっている。また、当たりは必ず入っている

		int stArea = 0;
		int endArea = cntNums;
		int centerI = 0;
		while (true) {
			centerI = (endArea - stArea) / 2 + stArea;
			if (nums[centerI] == targetNum)
				break;
			else if (nums[centerI] > targetNum)
				endArea = centerI - 1;
			else
				stArea = centerI + 1;
		}
		System.out.println(centerI + 1);

	}
}
