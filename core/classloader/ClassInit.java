package classloader;

public class ClassInit {
    public static void main(String[] args) throws NoSuchMethodException {
        System.out.println("Class: " + InitTest.class);
        InitTest[] data = new InitTest[10];
        System.out.println("Array InitTest[10] created");
        System.out.println(InitTest.class.getDeclaredConstructor());
        //^ До сюда класс InitTest еще не инициализирован
        System.out.println(new InitTest());

        //=================================

        try {
            new InitTestWithError();
        } catch (Throwable e) {
            e.printStackTrace(); //Ошибка при инициализации
//            java.lang.ExceptionInInitializerError
//            at classloader.ClassInit.main(ClassInit.java:15)
//            Caused by: java.lang.RuntimeException: Ooops!
//                    at classloader.InitTestWithError.<clinit>(ClassInit.java:34)
        }
        new InitTestWithError(); //Ошибка при обращении к несуществующему классу
//        Exception in thread "main" java.lang.NoClassDefFoundError: Could not initialize class classloader.InitTestWithError
//        at classloader.ClassInit.main(ClassInit.java:19)
    }
}

class InitTest {
    static {
        System.out.println("InitTest: I am initialized!");
    }
}

class InitTestWithError {
    static {
        System.out.println("InitTestWithError: I am starting initialize!");
//        throw new RuntimeException("Ooops!"); Так нельзя!
        if (true) {
            throw new RuntimeException("Ooops!"); //А так можно!
        }
    }
}