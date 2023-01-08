import java.util.Random;

public class Main {
    public static void main(String[] args) {
        doLoop();
    }

    static void doLoop() {
        long counter = 0;
        while (true) {
            String s = (char) (new Random()).nextInt(1024) + " ";
            System.out.println(s + ++counter);

        }
    }
}
