import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntNum = sc.nextInt();

		ArrayList<Integer> nums = new ArrayList<>();
		for (int i = 0; i < cntNum; i++) {
			nums.add(sc.nextInt());
		}

		int cntOperation = 0;
		while (nums.stream().allMatch(n -> n % 2 == 0)) {
			nums.replaceAll(n -> n / 2);
			cntOperation++;
		}

		// 出力
		System.out.println(cntOperation);
	}
}
