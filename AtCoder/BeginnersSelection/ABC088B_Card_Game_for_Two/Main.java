import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntCards = sc.nextInt();

		ArrayList<Integer> cards = new ArrayList<>();
		for (int i = 0; i < cntCards; i++) {
			cards.add(sc.nextInt());
		}

		int scoreAlice = 0;
		int scoreBob = 0;

		while (cards.size() > 0) {
			scoreAlice += popMaxNatualNum(cards);
			if (cards.size() == 0) {
				break;
			}
			scoreBob += popMaxNatualNum(cards);
		}

		System.out.println(scoreAlice - scoreBob);
	}

	private static Integer popMaxNatualNum(ArrayList<Integer> ary) {

		int maxNum = 0;
		for (int i = 0; i < ary.size(); i++) {
			if (maxNum < ary.get(i)) {
				maxNum = ary.get(i);
			}
		}
		if (maxNum != 0) {
			ary.remove(ary.indexOf(maxNum));
		}
		return maxNum;
	}
}
