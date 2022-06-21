public class Test {
    public static void main(String[] args) {
        Object[] objects =new Object[5];
        objects[0] = "the String";
        objects[3] = "the String";
        String s = (String) objects[0];
        String s1 = (String) objects[1];
        System.out.println(s + ", " + s1);
    }
}
