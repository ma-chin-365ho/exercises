import java.util.*;

/*
  しゃくとり法を使用すると高速化できる問題
*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntNums = sc.nextInt();
		long diff = sc.nextInt();
		long[] numsAsc = new long[cntNums];
		for (int i = 0; i < cntNums; i++) {
			numsAsc[i] = sc.nextInt();
		}

		// 数列の中での開始位置と終了位置(差)のインデックスの差。
		long[] cntPatterns = new long[cntNums - 1];
		int edIdx = 1;
		for (int i = 0; i < cntNums - 1; i++) {
			if (i == 0) {
				cntPatterns[i] = 0;
			} else {
				// 開始位置が一つ前に進むため、-1する。
				cntPatterns[i] = cntPatterns[i - 1] - 1;
			}

			while (edIdx <= cntNums - 1 && numsAsc[edIdx] - numsAsc[i] <= diff) {
				edIdx++;
				cntPatterns[i]++;
			}
		}

		System.out.println(Arrays.stream(cntPatterns).sum());
	}

}
