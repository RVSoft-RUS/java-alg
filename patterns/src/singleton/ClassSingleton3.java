package singleton;

public class ClassSingleton3 {
    private final String info = "Решение подходит если конструктор класса" +
            " не вызывает опасений создания исключительных ситуаций";

    private static class Holder {
        private final static ClassSingleton3 instance = new ClassSingleton3();
    }

    private ClassSingleton3() {
    }

    public static ClassSingleton3 getInstance() {
        return Holder.instance;
    }

}
