import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        System.out.println(String.format("%10s", Integer.toBinaryString(a)).replace(" ", "0"));
    }
}
