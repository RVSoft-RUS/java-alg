package multithreads;

import java.util.ArrayList;
import java.util.List;

public class Container {
    private static final List<String> list = new ArrayList<>();

//    synchronized
    public void addEntry(String s) {
        list.add(s);
    }

    public int size() {
        return list.size();
    }

    public static void main(String[] args) throws InterruptedException {
        Container container = new Container();

        Runnable foo = () -> {
            for (int i = 0; i < 100_000; i++) {
                container.addEntry("foo");
            }
        };

        List<Thread> threads = new ArrayList<>();
        for (long count = 10; count > 0; count--) {
            Thread thread = new Thread(foo);
            thread.start();
            threads.add(thread);
        }

        for (Thread thread : threads) {
            thread.join();
        }
        System.out.println(container.size());
    }
}
