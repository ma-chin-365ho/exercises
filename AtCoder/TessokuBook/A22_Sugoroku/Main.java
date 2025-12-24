import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題

   → 逆から計算した最大スコアをメモ化

*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntSquares = sc.nextInt();
		int[] toSquareAs = new int[cntSquares];
		int[] toSquareBs = new int[cntSquares];
		for (int i = 1; i <= cntSquares - 1; i++) {
			toSquareAs[i] = sc.nextInt();
		}
		for (int i = 1; i <= cntSquares - 1; i++) {
			toSquareBs[i] = sc.nextInt();
		}

		// System.out.println(Arrays.toString(toSquareAs));
		// System.out.println(Arrays.toString(toSquareBs));

		int scoreA = 100;
		int scoreB = 150;

		int[] maxScores = new int[cntSquares + 1];
		// 最後のマス
		maxScores[cntSquares] = 0;
		// 制約的に、最後の1個前のマスは最後のマスに進む番号しか書かれてない
		maxScores[cntSquares - 1] = scoreB > scoreA ? scoreB : scoreA;

		for (int squareNo = cntSquares - 2; squareNo >= 1; squareNo--) {
			// System.out.println("=========================");
			// System.out.println(squareNo);
			// System.out.println(toSquareAs[squareNo]);
			// System.out.println(maxScores[toSquareAs[squareNo]]);
			// System.out.println(toSquareBs[squareNo]);
			// System.out.println(maxScores[toSquareBs[squareNo]]);

			maxScores[squareNo] = Math.max(maxScores[toSquareAs[squareNo]] + scoreA,
					maxScores[toSquareBs[squareNo]] + scoreB);

		}

		// System.out.println(Arrays.toString(maxScores));

		System.out.println(maxScores[1]);
	}
}
