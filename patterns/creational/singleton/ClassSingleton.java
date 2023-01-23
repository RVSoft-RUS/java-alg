package creational.singleton;

public class ClassSingleton {
    private static ClassSingleton INSTANCE;
    private final String info = "Решение подходит исключительно для однопоточных приложений.";

    private ClassSingleton() {
    }

    public static ClassSingleton getInstance() {
        if(INSTANCE == null) {
            INSTANCE = new ClassSingleton();
        }
        return INSTANCE;
    }
}
