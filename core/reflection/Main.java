package reflection;

import multithreads.Container;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        Constructor<Container> constructor = Container.class.getConstructor();
        Container container = constructor.newInstance();
        Method[] methods = container.getClass().getMethods();

        Arrays.stream(methods).map(Method::getName).forEach(System.out::println);

        Method method = methods[2];
        method.invoke(container, "test arg");
        System.out.println(container.size());
    }
}
