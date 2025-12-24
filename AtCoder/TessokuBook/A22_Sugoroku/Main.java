import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題

*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntSquares = sc.nextInt();
		int[] toSquareAs = new int[cntSquares];
		int[] toSquareBs = new int[cntSquares];
		for (int i = 1; i <= cntSquares - 1; i++) {
			toSquareAs[i] = sc.nextInt();
			toSquareBs[i] = sc.nextInt();
		}

	}
}
