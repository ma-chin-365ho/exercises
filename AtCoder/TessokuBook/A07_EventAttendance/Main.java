import java.util.*;

/*
  累積和を使って解く方が高速の想定な問題。

	・累積和を使うために、一回出席のデータを変換する。

		変換前)
			1人目がL1日からR1日まで出席
			2人目がL2日からR2日まで出席
			...

		変換後)
			1日目にX1人参加開始　　　　　　　　(=+-Z1人増加)
			2日目にX2人参加開始、Y2人参加終了 (=+-Z人2増加)
			3日目にX3人参加開始、Y3人参加終了 (=+-Z人3増加)
			...

	・上記のデータを使えば、累積和を使い計算できる。
		前日の参加人数 + 当日の増加人数(Z) = 当日の人数が求められる。

*/

// 下記は、累積和を使えてないversionだが、一応全部ACなる。

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntDays = sc.nextInt();
		int cntHuman = sc.nextInt();

		ArrayList<int[]> attends = new ArrayList<>();
		for (int i = 0; i < cntHuman; i++) {
			attends.add(new int[] { sc.nextInt(), sc.nextInt() });
		}

		int[] attendCnts = new int[cntDays];
		for (int iH = 0; iH < cntHuman; iH++) {
			for (int iD = attends.get(iH)[0] - 1; iD < attends.get(iH)[1]; iD++) {
				attendCnts[iD]++;
			}
		}
		for (int iD = 0; iD < cntDays; iD++) {
			System.out.println(attendCnts[iD]);
		}
	}
}
