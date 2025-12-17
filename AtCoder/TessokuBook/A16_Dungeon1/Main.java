import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題

  → x部屋までの最短時間をメモ化する。
*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntRooms = sc.nextInt();
		int[] minutesA = new int[cntRooms - 1];
		int[] minutesB = new int[cntRooms - 2];
		for (int i = 0; i < cntRooms - 1; i++) {
			minutesA[i] = sc.nextInt();
		}
		for (int i = 0; i < cntRooms - 2; i++) {
			minutesB[i] = sc.nextInt();
		}

		// System.out.print(Arrays.toString(minutesA));
		// System.out.print(Arrays.toString(minutesB));

		int[] minuteMin = new int[cntRooms - 1];
		minuteMin[2 - 2] = minutesA[2 - 2];
		minuteMin[3 - 2] = Math.min(minutesA[2 - 2] + minutesA[3 - 2], minutesB[3 - 3]);

		for (int toRoomNum = 4; toRoomNum <= cntRooms; toRoomNum++) {
			// System.out.println(toRoomNum);
			// System.out.println(Arrays.toString(minuteMin));
			// System.out.println(minuteMin[toRoomNum - 2]);
			// System.out.println(minuteMin[(toRoomNum - 2) - 1]);
			// System.out.println(minutesA[toRoomNum - 2]);
			// System.out.println(minuteMin[(toRoomNum - 2) - 2]);
			// System.out.println(minutesB[toRoomNum - 3]);
			minuteMin[toRoomNum - 2] = Math.min(minuteMin[(toRoomNum - 2) - 1] + minutesA[toRoomNum - 2],
					minuteMin[(toRoomNum - 2) - 2] + minutesB[toRoomNum - 3]);
			// System.out.println("****************************************");
		}
		System.out.println(minuteMin[(cntRooms - 1) - 1]);
	}

}
