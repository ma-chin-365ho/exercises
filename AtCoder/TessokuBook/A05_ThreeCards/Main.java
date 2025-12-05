import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int maxNum = sc.nextInt();
        int sum = sc.nextInt();

        int cntPattern = 0;
        for (int iRed = 1; iRed <= maxNum; iRed++) {
            for (int iBlue = 1; iBlue <= maxNum; iBlue++) {
                int iWhiteQ = sum - (iRed + iBlue);
                if (iWhiteQ >= 1 && iWhiteQ <= maxNum) {
                    cntPattern++;
                }
            }
        }
        System.out.println(cntPattern);
    }
}
