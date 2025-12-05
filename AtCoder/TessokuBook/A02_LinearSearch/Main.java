import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntNum = sc.nextInt();
		int trgNum = sc.nextInt();

		ArrayList<Integer> nums = new ArrayList<>();
		for (int i = 0; i < cntNum; i++) {
			nums.add(sc.nextInt());
		}

		System.out.println(nums.contains(trgNum) ? "Yes" : "No");
	}
}
