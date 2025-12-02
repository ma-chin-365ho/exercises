import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int cnt500 = sc.nextInt();
        int cnt100 = sc.nextInt();
        int cnt50 = sc.nextInt();
        int sum = sc.nextInt();

        int cntPattern = 0;

        for (int i500 = 0; i500 <= cnt500; i500++) {
            for (int i100 = 0; i100 <= cnt100; i100++) {
                for (int i50 = 0; i50 <= cnt50; i50++) {
                    if ((500 * i500) + (100 * i100) + (50 * i50) == sum) {
                        cntPattern++;
                    }
                }
            }
        }

        System.out.println(cntPattern);
    }
}
