import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s = sc.next();

		String[] words = { "dreamer", "eraser", "dream", "erase" };

		for (int i = 0; i < words.length; i++) {
			s = s.replace(words[i], "");
			System.out.println(s);
		}

		System.out.println(s.length() == 0 ? "YES" : "NO");
	}
}
