import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題

*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntBlocks = sc.nextInt();
		int[] laterOutBlocks = new int[cntBlocks];
		int[] scores = new int[cntBlocks];
		for (int i = 0; i < cntBlocks; i++) {
			laterOutBlocks[i] = sc.nextInt();
			scores[i] = sc.nextInt();
		}

		int[][] maxScores = new int[cntBlocks][cntBlocks];

		// NOTE: 最後の1個残った状態から、最後の1個を取る操作でスコアリングされることはない。
		int maxSocreLeftBlock = 0;
		int maxSocreRightBlock = 0;
		for (int leftEndNo = 1; leftEndNo <= cntBlocks; leftEndNo++) {
			for (int rightEndNo = cntBlocks; rightEndNo >= leftEndNo; rightEndNo--) {
				// 最後に左側のブロックを取る場合
				if (leftEndNo > 1) {
					maxSocreLeftBlock = maxScores[(leftEndNo - 1) - 1][rightEndNo - 1];
					if (laterOutBlocks[(leftEndNo - 1) - 1] >= leftEndNo
							&& laterOutBlocks[(leftEndNo - 1) - 1] <= rightEndNo) {
						maxSocreLeftBlock += scores[(leftEndNo - 1) - 1];
					}
				} else {
					// 最後に左側のブロックを取る操作できない。
					maxSocreLeftBlock = 0;
				}
				// 最後に右側のブロックを取る場合
				if (rightEndNo < cntBlocks) {
					maxSocreRightBlock = maxScores[leftEndNo - 1][(rightEndNo - 1) + 1];
					if (laterOutBlocks[(rightEndNo - 1) + 1] >= leftEndNo
							&& laterOutBlocks[(rightEndNo - 1) + 1] <= rightEndNo) {
						maxSocreRightBlock += scores[(rightEndNo - 1) + 1];
					}
				} else {
					// 最後に右側のブロックを取る操作できない。
					maxSocreRightBlock = 0;
				}
				maxScores[(leftEndNo - 1)][(rightEndNo - 1)] = Math.max(maxSocreLeftBlock, maxSocreRightBlock);
			}
		}

		int maxScore = 0;
		for (int i = 0; i < cntBlocks; i++) {
			maxScore = Math.max(maxScore, maxScores[i][i]);
		}
		System.out.println(maxScore);
	}
}
