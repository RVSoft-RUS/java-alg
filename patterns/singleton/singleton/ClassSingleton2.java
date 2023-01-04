package singleton.singleton;

public class ClassSingleton2 {
    private static final ClassSingleton2 INSTANCE = new ClassSingleton2();
    private final String info = "Решение подходит для многопоточных приложений," +
            " при условии отсутствия опасности возникновения исключительных ситуаций в конструкторе" +
            " и отсутствии необходимости ленивой инициализации..";

    private ClassSingleton2() {
    }

    public static ClassSingleton2 getInstance() {
        return INSTANCE;
    }

}
