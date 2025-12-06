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


	}
}
