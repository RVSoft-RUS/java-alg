package src;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Test {
    public static void main(String[] args) {
//        Top t = new Top();
//        Sub sub = (Sub) t;

        Object sub = new Object();
        String str = (String) sub;

        Object[] objects =new Object[5];
        objects[0] = "the String";
        objects[3] = "the String";
        String s = (String) objects[0];
        String s1 = (String) objects[1];
        System.out.println(s + ", " + s1);
    }

    public static <T> List<T> doSmth(List<T> list) {
        ArrayList<T> u = new ArrayList<>();

        list.forEach(e -> {
            if (!u.contains(e)) {
                u.add(e);
            }
        });

        return u;
    }

    public static <T> List<T> doSmth2(List<T> list) {
        Set<T> set = new HashSet<>(list);

        return new ArrayList<>(set);
    }
}
