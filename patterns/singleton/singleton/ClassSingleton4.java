package singleton.singleton;

public class ClassSingleton4 {
    private static ClassSingleton4 instance = new ClassSingleton4();
    private final String info = "Минус - многократная синхронизация";

    private ClassSingleton4() {
    }

    public static synchronized ClassSingleton4 getInstance() {
        if (instance == null) {
            instance = new ClassSingleton4();
        }
        return instance;
    }

}
