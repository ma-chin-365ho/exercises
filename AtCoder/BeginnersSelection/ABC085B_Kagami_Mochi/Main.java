import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cntMochis = sc.nextInt();

		ArrayList<Integer> mochis = new ArrayList<>();
		for (int i = 0; i < cntMochis; i++) {
			mochis.add(sc.nextInt());
		}
		HashSet<Integer> mochiset = new HashSet<>(mochis);

		System.out.println(mochiset.size());
	}

}
