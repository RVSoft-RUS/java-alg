import java.io.IOException;

public class Test {
    public static void main(String[] args) {
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
}

class SomeResource implements java.io.Closeable {
    public void close() throws IOException {
        throw new IOException("Close Exception");
    }
}
