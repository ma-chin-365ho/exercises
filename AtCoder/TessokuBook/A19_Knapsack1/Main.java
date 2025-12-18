import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題

    → N個の品物,重さの合計W以下となる最大価値を二次元配列(N,W)でメモ化する。

*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntItems = sc.nextInt();
		int weight = sc.nextInt();
		int[] itemWeights = new int[cntItems];
		int[] itemValues = new int[cntItems];
		for (int i = 0; i < cntItems; i++) {
			itemWeights[i] = sc.nextInt();
			itemValues[i] = sc.nextInt();
		}

		long[][] maxValues = new long[cntItems][weight];

		// 品物が1個の場合の最大価値を設定。
		for (int iW = 0; iW < itemWeights[0] - 1; iW++) {
			maxValues[0][iW] = 0;
		}
		for (int iW = itemWeights[0] - 1; iW < weight; iW++) {
			maxValues[0][iW] = itemValues[0];
		}

		for (int iI = 1; iI < cntItems; iI++) {
			for (int iW = 0; iW < weight; iW++) {

				if (itemWeights[iI] > (iW + 1)) {
					maxValues[iI][iW] = maxValues[iI - 1][iW];
				} else {
					if (itemWeights[iI] == (iW + 1)) {
						maxValues[iI][iW] = Math.max(maxValues[iI - 1][iW], itemValues[iI]);
					} else {
						maxValues[iI][iW] = Math.max(maxValues[iI - 1][iW],
								maxValues[iI - 1][(iW + 1) - itemWeights[iI] - 1] + itemValues[iI]);
					}
				}
			}
		}
		System.out.println(maxValues[cntItems - 1][weight - 1]);
	}

}
