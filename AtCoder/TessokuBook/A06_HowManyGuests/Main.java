import java.util.*;

/*
  累積和を使用すれば、計算量が抑えられる。
*/

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntDays = sc.nextInt();
		int cntQuestions = sc.nextInt();

		ArrayList<Integer> guestCnts = new ArrayList<>();
		for (int i = 0; i < cntDays; i++) {
			guestCnts.add(sc.nextInt());
		}
		ArrayList<int[]> questions = new ArrayList<>();
		for (int i = 0; i < cntQuestions; i++) {
			questions.add(new int[] { sc.nextInt(), sc.nextInt() });
		}

		ArrayList<Integer> cumulativeSum = new ArrayList<>();
		cumulativeSum.add(guestCnts.get(0));
		for (int i = 1; i < cntDays; i++) {
			cumulativeSum.add(cumulativeSum.get(i - 1) + guestCnts.get(i));
		}

		// for (int i = 0; i < cumulativeSum.size(); i++) {
		// System.out.println(cumulativeSum.get(i));
		// }

		for (int iQ = 0; iQ < cntQuestions; iQ++) {
			if (questions.get(iQ)[0] == 1) {
				System.out.println(cumulativeSum.get(questions.get(iQ)[1] - 1));

			} else {
				System.out.println(cumulativeSum.get(questions.get(iQ)[1] - 1) -
						cumulativeSum.get((questions.get(iQ)[0] - 1) - 1));
			}
		}
	}
}
