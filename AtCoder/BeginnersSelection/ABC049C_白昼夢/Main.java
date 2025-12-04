import java.util.*;

// **************************************
// ACx3 TLEx16
// **************************************

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s = sc.next();

		String[] words = { "dreamer", "eraser", "dream", "erase" };

		while (true) {
			int lenBf = s.length();
			for (int i = 0; i < words.length; i++) {
				s = s.replaceAll(words[i]+"$", "");
			}
			int lenAf = s.length();
			if (lenBf == lenAf) break;
		}
		
		System.out.println(s.length() == 0 ? "YES" : "NO");
	}
}
