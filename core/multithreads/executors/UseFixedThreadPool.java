package multithreads.executors;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class UseFixedThreadPool {
    static int TASK_COUNT = 40;
    static int TASK_SIZE = 1_000_000;

    public static void main(String[] args) throws InterruptedException {

        withExecutor();
        withoutExecutor();

        System.exit(0);
    }

    private static void withExecutor() {
        ExecutorService executorService = Executors.newFixedThreadPool(4);
        List<Runnable> tasks = new ArrayList<>();
        CountDownLatch latch = new CountDownLatch(TASK_COUNT);

        for (int i = 0; i < TASK_COUNT; i++) {
            tasks.add(() -> {
                String[] randomText = new String[TASK_SIZE];
                Random random = new Random();

                for (int j = 0; j < TASK_SIZE; j++) {
                    randomText[j] = String.valueOf((char) random.nextInt(255));
                }
                latch.countDown();
                System.out.print("* ");
            });
        }

        for (Runnable task : tasks) {
            executorService.submit(task);
        }
//        latch.await(); // Дождаться выполнения всех
    }

    private static void withoutExecutor() {
        for (int i = 0; i < TASK_COUNT; i++) {
            String[] randomText = new String[TASK_SIZE];
            Random random = new Random();

            for (int j = 0; j < TASK_SIZE; j++) {
                randomText[j] = String.valueOf((char) random.nextInt(255));
            }
            System.err.print("* ");
        }
    }
}
