import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cnt = sc.nextInt();
		int sum = sc.nextInt();

		for (int i10 = 0; i10 <= cnt; i10++) {
			for (int i5 = 0; i5 <= cnt - i10; i5++) {
				int i1 = cnt - i10 - i5;
				if ((10000 * i10) + (5000 * i5) + (1000 * i1) == sum) {
					System.out.println(i10 + " " + i5 + " " + i1);
					return;
				}
			}
		}

		System.out.println("-1 -1 -1");
	}
}
