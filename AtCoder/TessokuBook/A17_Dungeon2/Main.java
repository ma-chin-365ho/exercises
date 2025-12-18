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

		int[] minuteMin = new int[cntRooms - 1];
		minuteMin[2 - 2] = minutesA[2 - 2];
		minuteMin[3 - 2] = Math.min(minutesA[2 - 2] + minutesA[3 - 2], minutesB[3 - 3]);

		for (int toRoomNum = 4; toRoomNum <= cntRooms; toRoomNum++) {
			minuteMin[toRoomNum - 2] = Math.min(minuteMin[(toRoomNum - 2) - 1] + minutesA[toRoomNum - 2],
					minuteMin[(toRoomNum - 2) - 2] + minutesB[toRoomNum - 3]);
		}

		ArrayList<Integer> routes = new ArrayList<>();
		int roomNum = cntRooms;
		while (true) {
			routes.add(roomNum);

			// System.out.println(routes.toString());

			if (roomNum == 2) {
				routes.add(1);
				break;
			} else if (roomNum == 1) {
				break;
			}

			// Aの通路とBの通路どちらが最適か
			if (minuteMin[roomNum - 2] == minuteMin[(roomNum - 1) - 2] + minutesA[roomNum - 2]) {
				roomNum += -1;
			} else {
				roomNum += -2;
			}
		}

		StringJoiner sj = new StringJoiner(" ");
		for (int i = routes.size() - 1; i >= 0; i--) {
			sj.add(String.valueOf(routes.get(i)));
		}
		System.out.println(routes.size());
		System.out.println(sj.toString());
	}

}
