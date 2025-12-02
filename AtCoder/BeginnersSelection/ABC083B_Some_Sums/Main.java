import java.util.*;
import java.util.stream.Stream;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt();
		int min = sc.nextInt();
		int max = sc.nextInt();
		int sum = 0;

		// System.out.println(num);
		// System.out.println(min);
		// System.out.println(max);

		for (int iNum = 1; iNum <= num; iNum++) {
			char[] cDigits = String.valueOf(iNum).toCharArray();

			int[] digits = new int[cDigits.length];
			for (int iD = 0; iD < cDigits.length; iD++) {
				digits[iD] = Integer.parseInt(String.valueOf(cDigits[iD]));
			}
			int sumDigits = Arrays.stream(digits).sum();
			// System.out.println(sumDigits);
			if (sumDigits >= min && sumDigits <= max) {
				sum += iNum;
			}
		}

		System.out.println(sum);
	}
}
