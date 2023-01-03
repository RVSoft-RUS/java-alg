package singleton;

public class ClassSingleton6 { //лучше делать final
    private static volatile ClassSingleton6 instance;
    private final String info = "использование volatile модификатора может привести" +
            " к проблемам производительности на мультипроцессорных системах";

    private ClassSingleton6() {
    }

    public static ClassSingleton6 getInstance() {
        if (instance == null) {
            synchronized (ClassSingleton6.class) {
                if (instance == null) {
                    instance = new ClassSingleton6();
                }
            }
        }
        return instance;
    }
}
