import java.util.*;

/*
  累積和を使って解く方が高速の想定な問題。

  ・マス (i,j)に対して累積和を作成する。
		(i, j) = 下記エリアの和。
			(0, 0) 〜 (i, 0) 
			(0, 1) 〜 (i, 1) 
			(0, 2) 〜 (i, 2) 
			...
			(0, j) 〜 (i, j) 

  ・左上(x1, y1)から右下(x2, y2)のエリアの和[ANS] = 
	累積和(x2,y2)[A+B+C+ANS] - 累積和(x2,y1 - 1)[A+B] - 累積和(x1 - 1, y2)[A+C] + 累積和(x1-1, y1-1)[A] 
	-----------
	| A |  B  |
	|   |     |
	-----------
	| C | ANS |
	|   |     |
	-----------

*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int hight = sc.nextInt();
		int width = sc.nextInt();

		int[][] nums = new int[hight][width];
		for (int iH = 0; iH < hight; iH++) {
			for (int iW = 0; iW < width; iW++) {
				nums[iH][iW] = sc.nextInt();
			}
		}

		int cntQuestion = sc.nextInt();
		int[][] rect = new int[cntQuestion][4];
		for (int iQ = 0; iQ < cntQuestion; iQ++) {
			rect[iQ][0] = sc.nextInt();
			rect[iQ][1] = sc.nextInt();
			rect[iQ][2] = sc.nextInt();
			rect[iQ][3] = sc.nextInt();
		}

		int[][] cumulativeSum = new int[hight + 1][width + 1];

		for (int i = 0; i <= hight; i++) {
			for (int j = 0; j <= width; j++) {
				cumulativeSum[i][j] = 0;
			}
		}

		for (int i = 1; i <= hight; i++) {
			for (int j = 1; j <= width; j++) {
				cumulativeSum[i][j] = cumulativeSum[i][j - 1] + nums[i - 1][j - 1];
			}
		}
		for (int i = 1; i <= hight; i++) {
			for (int j = 1; j <= width; j++) {
				cumulativeSum[i][j] = cumulativeSum[i - 1][j] + cumulativeSum[i][j];
			}
		}

		for (int iQ = 0; iQ < cntQuestion; iQ++) {
			System.out.println(cumulativeSum[rect[iQ][2]][rect[iQ][3]] - cumulativeSum[rect[iQ][2]][rect[iQ][1] - 1]
					- cumulativeSum[rect[iQ][0] - 1][rect[iQ][3]] + cumulativeSum[rect[iQ][0] - 1][rect[iQ][1] - 1]);
		}
	}
}
