import java.util.*;

/*
  二分探索を使用すると高速化できる問題
*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntNums = sc.nextInt();
		ArrayList<Long> nums = new ArrayList<>();
		for (int i = 0; i < cntNums; i++) {
			nums.add(Long.valueOf(sc.nextInt()));
		}

		Set<Long> setNums = new HashSet<>(nums);
		List<Long> numsUqAsc = new ArrayList<>(setNums);
		Collections.sort(numsUqAsc);

		// System.out.println(numsUqAsc.toString());

		ArrayList<Long> numsAns = new ArrayList<>();
		for (int i = 0; i < cntNums; i++) {
			numsAns.add(Long.valueOf(Collections.binarySearch(numsUqAsc, nums.get(i)) + 1));
		}

		StringJoiner sj = new StringJoiner(" ");
		for (int i = 0; i < cntNums; i++) {
			sj.add(String.valueOf(numsAns.get(i)));
		}
		System.out.println(sj.toString());

	}

}
