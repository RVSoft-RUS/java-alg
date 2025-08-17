import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.concurrent.Callable;

public class A {
    int  x = 7;

    public A(int x) {
        this.x = x;
    }
    public A() {
        this(5);
    }
}

 class B extends A {
     public B() {
         super();
     }

     public static void main(String[] args) {

         A a = new B();
         System.out.println(a.x);

         try {
             throw new ArithmeticException("1");
         } catch (Exception e) {
             System.out.println(2);
         } finally {
             System.out.println(3);
         }

         LinkedList<String> names = new LinkedList<>();
         names.add("A");
         names.addFirst("B");
         names.addLast("C");
         names.remove("A");
         System.out.println(names.getFirst());

         System.out.println("PriorityQueue");
         PriorityQueue<Integer> queue = new PriorityQueue<>();
         queue.add(10);
         queue.add(20);
         queue.add(5);
         System.out.println(queue.poll());
     }
 }
 interface X extends Callable<String> {
     @Override
     default String call() throws Exception {
         return "";
     }
 }