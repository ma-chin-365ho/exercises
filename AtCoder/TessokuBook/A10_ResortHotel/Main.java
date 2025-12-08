import java.util.*;

/*
  累積和を使って解く方が高速の想定な問題。
*/

// Math.maxを使わないver.

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntRooms = sc.nextInt();
		int[] cntPersonInRooms = new int[cntRooms];
		for (int i = 0; i < cntRooms; i++) {
			cntPersonInRooms[i] = sc.nextInt();
		}
		int cntDays = sc.nextInt();
		int[][] unavailableRooms = new int[cntDays][2];
		for (int i = 0; i < cntDays; i++) {
			unavailableRooms[i][0] = sc.nextInt();
			unavailableRooms[i][1] = sc.nextInt();
		}

		int[] cumulativeMaxsLtoR = new int[cntRooms];
		int[] cumulativeMaxsRtoL = new int[cntRooms];

		// 左の部屋から右に最大値を累積していく
		cumulativeMaxsLtoR[0] = cntPersonInRooms[0];
		for (int i = 1; i < cntRooms; i++) {
			if (cntPersonInRooms[i] > cumulativeMaxsLtoR[i - 1]) {
				cumulativeMaxsLtoR[i] = cntPersonInRooms[i];
			} else {
				cumulativeMaxsLtoR[i] = cumulativeMaxsLtoR[i - 1];
			}
		}

		// 右の部屋から左に最大値を累積していく
		cumulativeMaxsRtoL[cntRooms - 1] = cntPersonInRooms[cntRooms - 1];
		for (int i = cntRooms - 2; i >= 0; i--) {
			if (cntPersonInRooms[i] > cumulativeMaxsRtoL[i + 1]) {
				cumulativeMaxsRtoL[i] = cntPersonInRooms[i];
			} else {
				cumulativeMaxsRtoL[i] = cumulativeMaxsRtoL[i + 1];
			}
		}

		for (int iD = 0; iD < cntDays; iD++) {
			// 工事区間の左側の最大値と右側の最大値を比較し、大きい方が全体の最大値
			// 制約 2 ≤ Li ≤Ri ≤N−1 のため、一番左の部屋と一番右の部屋は使用不可にならない。
			System.out.println(cumulativeMaxsLtoR[unavailableRooms[iD][0] - 1
					- 1] > cumulativeMaxsRtoL[unavailableRooms[iD][1] - 1 + 1]
							? cumulativeMaxsLtoR[unavailableRooms[iD][0] - 1
									- 1]
							: cumulativeMaxsRtoL[unavailableRooms[iD][1] - 1 + 1]);
		}
	}
}
