package classloader;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;

public class MyClassLoader extends ClassLoader{
    @Override
    public Class<?> loadClass(String name) throws ClassNotFoundException {
        if (name.equals("MyRunnable")) {
            try (InputStream stream = MyRunnable.class.getResourceAsStream("MyRunnable.class")) {
                assert stream != null;
                byte[] classData = stream.readAllBytes();
                return defineClass("MyRunnable", classData, 0, classData.length);
            } catch (IOException e) {
                throw new ClassNotFoundException();
            }
        }
        return super.loadClass(name);
    }

    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException,
            InvocationTargetException, InstantiationException, IllegalAccessException {
        Runnable orig = new MyRunnable();
        orig.run();

        ClassLoader loader = new MyClassLoader();
//        ClassLoader loader = new ClassLoader() {
//            @Override
//            public Class<?> loadClass(String name) throws ClassNotFoundException {
//                if (name.equals("MyRunnable")) {
//                    try (InputStream stream = MyRunnable.class.getResourceAsStream("MyRunnable.class")) {
//                        byte[] classData = stream.readAllBytes();
//                        return defineClass("MyRunnable", classData, 0, classData.length);
//                    } catch (IOException e) {
//                        throw new ClassNotFoundException();
//                    }
//                }
//                return super.loadClass(name);
//            }
//        };

        Class<?> loadedClass = loader.loadClass("classloader.MyRunnable");
        Runnable loaded = loadedClass.asSubclass(Runnable.class).getConstructor().newInstance();
        loaded.run();

        System.out.println(orig.getClass().getClassLoader());
        System.out.println(loaded.getClass().getClassLoader());
    }
}
