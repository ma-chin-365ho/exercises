import java.util.*;

/*
  AC x5 TLE x5

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

		int sum = 0;
		for (int iQ = 0; iQ < cntQuestions; iQ++) {
			sum = 0;
			for (int iG = questions.get(iQ)[0] - 1; iG < questions.get(iQ)[1]; iG++) {
				sum += guestCnts.get(iG);
			}
			System.out.println(sum);
		}
	}
}
