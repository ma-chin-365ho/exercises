import java.util.*;

/**************************************************

	最短距離でその点に到達後、残り時間が偶数の場合は到達可能。

	【理由】	
		1.奇数時刻の場合は同じ点に戻って来れない。(行って戻ってくる必要があるため、必ず偶数時刻が必要。)
		2.先に回り道しても、最短距離で到達した後時間潰しても、どう言うルートで行っても到達可否は変わらない。
 */


public class Main {


	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntPlan = sc.nextInt();

		ArrayList<Plan> plans = new ArrayList<>();
		for (int i = 0; i < cntPlan; i++) {
			Plan p = new Plan(sc);
			plans.add(p);
		}

		Plan nowPlan = new Plan(0, 0, 0);
		for (int i = 0; i < cntPlan; i++) {
			// 目的地に最短距離で到達後の残り時間
			int tRest = (plans.get(i).t - nowPlan.t) - Math.abs(plans.get(i).x - nowPlan.x) - Math.abs(plans.get(i).y - nowPlan.y);

			// 最短距離で向かった場合に時刻間に合うかどうか
			if ( tRest < 0 ) {
				System.out.println("No");
				return;
			}

			// 経由地到達後、時間を潰せるかどうか
			if ( tRest % 2 == 1) {
				System.out.println("No");
				return;
			}

			nowPlan.t = plans.get(i).t;
			nowPlan.x = plans.get(i).x;
			nowPlan.y = plans.get(i).y;
		}

		System.out.println("Yes");
		return;
	}

}

class Plan {
	public int t;
	public int x;
	public int y;

	Plan(Scanner sc) {
		this.t = sc.nextInt();
		this.x = sc.nextInt();
		this.y = sc.nextInt();
	}

	Plan(int t, int x, int y) {
		this.t = t;
		this.x = x;
		this.y = y;
	}
}
