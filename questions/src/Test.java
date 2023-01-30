import ru.rvsoft.list.List;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Test {
    public static void main(String[] args) {
        List<String> list = List.Companion.invoke("1", "2", "3", "4");
        List<String> list2 = list.add("000");
        System.out.println(list2);

        tryThrow();
        System.out.println(tryInt());

        try {
            try (SomeResource r = new SomeResource()) {
                System.out.println("try");
                throw new RuntimeException("RuntimeException");
            } catch (IOException e) {
                System.out.println("catch");
                System.out.println(e.getMessage());
            }
        } finally {
            System.out.println("finally");
        }
    }

    private static int tryInt() {
        try {
            int x = 0;
            return 1 / x;
        } catch (Exception e) {
            return 2;
        } finally {
            return 33; // returns 33
        }
    }

    private static int tryThrow() {
        try {
            int x = 0;
            return 1 / x;
        } catch (Exception e) {
            throw new RuntimeException("Catch");
        } finally {
            throw new RuntimeException("Finally");
        }
    }

    private void anyFun() throws FileNotFoundException {
        FileInputStream fis = new FileInputStream("");
        Map<FileInputStream, Object> map = new HashMap<>();
        map.put(fis, null);
        map.compute(fis, (x, y) -> {
            try {
                return x.equals(new FileInputStream("")) && y.equals(x);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            return y;
        });
    }
}

class SomeResource implements java.io.Closeable {
    public void close() throws IOException {
        throw new IOException("Close Exception");
    }
}
