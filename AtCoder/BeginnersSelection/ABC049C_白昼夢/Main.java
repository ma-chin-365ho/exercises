import java.util.*;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s = sc.next();

		String[] words = { "dreamer", "eraser", "dream", "erase" };

		boolean isHit = false;
		boolean isNext = true;
		while (isNext) {
			isHit = false;
			for (int i = 0; i < words.length; i++) {
		        if (s.equals(words[i])) {
		      		System.out.println("YES");
		      		isHit = true;
		      		isNext = false;
		          	break;
		        }
			    if (s.length() >= words[i].length() && s.substring(s.length() - words[i].length()).equals(words[i])) {
					s = s.substring(0, s.length() - words[i].length());
			  		isHit = true;
			   	}
			}
			if (isHit == false) {
	    		System.out.println("NO");
  				break;
			}
		}
	}
}
