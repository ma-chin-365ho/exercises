import java.util.*;

/*
  動的計画法(部分問題の解のメモ化)を使用すると高速化できる問題
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

	}

}
