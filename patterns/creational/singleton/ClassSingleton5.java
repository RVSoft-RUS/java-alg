package singleton;

public class ClassSingleton5 {
    private static ClassSingleton5 instance;
    private final String info = "Наиболее распространенный способ — «Double-Checked Locking». В своем оригинальном варианте." +
            "Не работает";

    private ClassSingleton5() {
    }

    public static ClassSingleton5 getInstance() {
        if (instance == null) {
            synchronized (ClassSingleton5.class) {
                if (instance == null) {
                    instance = new ClassSingleton5();
                }
            }
        }
        return instance;
    }
}
