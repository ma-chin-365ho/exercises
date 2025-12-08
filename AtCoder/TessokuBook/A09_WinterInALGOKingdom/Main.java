import java.util.*;

/*
  累積和を使って解く方が高速の想定な問題。

   ・積雪エリアをX軸方向Y軸方向に見た時の増減値に変換する。
   ・増減値を利用して、累積和作成。

*/

public class Main {
	private static final int LEFT_TOP_X = 0;
	private static final int LEFT_TOP_Y = 1;
	private static final int RIGHT_BOTTOM_X = 2;
	private static final int RIGHT_BOTTOM_Y = 3;

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int hight = sc.nextInt();
		int width = sc.nextInt();
		int cntDays = sc.nextInt();

		int[][] rect = new int[cntDays][4];
		for (int iD = 0; iD < cntDays; iD++) {
			rect[iD][LEFT_TOP_Y] = sc.nextInt();
			rect[iD][LEFT_TOP_X] = sc.nextInt();
			rect[iD][RIGHT_BOTTOM_Y] = sc.nextInt();
			rect[iD][RIGHT_BOTTOM_X] = sc.nextInt();
		}

		int[][] diffSnows = new int[hight][width];
		int[][] accumulationSnows = new int[hight][width];
		for (int i = 0; i < hight; i++) {
			for (int j = 0; j < width; j++) {
				diffSnows[i][j] = 0;
				accumulationSnows[i][j] = 0;
			}
		}

		for (int iD = 0; iD < cntDays; iD++) {
			// 積雪1cm開始点
			diffSnows[rect[iD][LEFT_TOP_Y] - 1][rect[iD][LEFT_TOP_X] - 1] += 1;
			if (rect[iD][RIGHT_BOTTOM_X] < width) {
				// 積雪1cm終了点(X軸右向き)
				diffSnows[rect[iD][LEFT_TOP_Y] - 1][rect[iD][RIGHT_BOTTOM_X]] += -1;
			}
			if (rect[iD][RIGHT_BOTTOM_Y] < hight) {
				// 積雪1cm終了点(Y軸右向き)
				diffSnows[rect[iD][RIGHT_BOTTOM_Y]][rect[iD][LEFT_TOP_X] - 1] += -1;
			}
			if (rect[iD][RIGHT_BOTTOM_X] < width && rect[iD][RIGHT_BOTTOM_Y] < hight) {
				// 積雪1cm終了点(この点のみ引きすぎてしまう(-2される)ので、補正)
				diffSnows[rect[iD][RIGHT_BOTTOM_Y]][rect[iD][RIGHT_BOTTOM_X]] += 1;
			}
		}

		// 累積和作成
		// X軸の右向きに足し合わせ
		for (int i = 0; i < hight; i++) {
			accumulationSnows[i][0] = diffSnows[i][0];
			for (int j = 1; j < width; j++) {
				accumulationSnows[i][j] = accumulationSnows[i][j - 1] + diffSnows[i][j];
			}
		}
		// Y軸の下向きに足し合わせ
		for (int i = 1; i < hight; i++) {
			for (int j = 0; j < width; j++) {
				accumulationSnows[i][j] = accumulationSnows[i - 1][j] + accumulationSnows[i][j];
			}
		}

		for (int i = 0; i < hight; i++) {
			StringJoiner sj = new StringJoiner(" ");
			for (int j = 0; j < width; j++) {
				sj.add(String.valueOf(accumulationSnows[i][j]));
			}
			System.out.println(sj.toString());
		}
	}
}
