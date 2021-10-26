import java.io.*;
import java.util.ArrayList;

/**
 * @author RVSoft
 */
public class EffectiveArrayListRemove {
    /*
    Предложите эффективный алгоритм удаления нескольких рядом стоящих элементов из середины списка, реализуемого ArrayList.
     */
    static long start;
    static long finish;
    //позиция, с которой удаляем
    private static int m = 0;
    //количество удаляемых элементов
    private static int n = 0;
    //количество элементов в списке
    private static final int size = 1_000_000;
    //основной список (для удаления вызовом remove() и его копия для удаления путём перезаписи)
    private static ArrayList<Integer> initList, copyList1, copyList2;

    public static void main(String[] args) {

        initList = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            initList.add(i);
        }
        System.out.println("Список из " + size + " элементов заполнен");

        copyList1 = new ArrayList<>(initList);
        copyList2 = new ArrayList<>(initList);
        System.out.println("Созданы копии списка\n");

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        try {
            System.out.print("С какой позиции удаляем? > ");
            m = Integer.parseInt(br.readLine());
            System.out.print("Сколько удаляем? > ");
            n = Integer.parseInt(br.readLine());
        } catch (IOException e) {
            System.err.println(e);
        }
        System.out.println("\nВыполняем удаление вызовом remove()...");

        startTiming();

        int i = m;
        while (i < m + n) {
            initList.remove(m);
            i++;
        }

        stopTiming("Время удаления с помощью вызова remove()");
        System.out.println("Размер исходного списка после удаления: " + initList.size());

        System.out.println("\nВыполняем удаление путем перезаписи...\n");

        startTiming();

        removeEfficiently();

        stopTiming("Время удаления путём смещения");
        System.out.println("Размер копии списка:" + copyList1.size());

        System.out.println("\nВыполняем удаление через SubList...\n");

        startTiming();

        copyList2.subList(m, m + n).clear();

        stopTiming("Время удаления через саблист");
        System.out.println("Размер копии списка:" + copyList2.size());
//        System.out.println(initList);
//        System.out.println(copyList1);
//        System.out.println(copyList2);

    }

    private static void removeEfficiently() {
        /* если необходимо удалить все элементы, начиная с указанного,
         * то удаляем элементы с конца до m
         */
        if (m + n >= size) {
            int i = size - 1;
            while (i != m - 1) {
                copyList1.remove(i);
                i--;
            }
        } else {
            //переменная k необходима для отсчёта сдвига начиная от места вставка m
            for (int i = m + n, k = 0; i < size; i++, k++) {
                copyList1.set(m + k, copyList1.get(i));
            }

            /* удаляем ненужные элементы в конце списка
             * удаляется всегда последний элемент, так как время этого действия
             * фиксировано и не зависит от размера списка
             */
            int i = size - 1;
            while (i != size - n - 1) {
                copyList1.remove(i);
                i--;
            }
            //сокращаем длину списка путём удаления пустых ячеек
            copyList1.trimToSize();
        }
    }

    private static void startTiming() {
        start = System.currentTimeMillis();
    }

    private static void stopTiming(String text) {
        finish = System.currentTimeMillis() - start;
        System.out.println(text + ", ms: " + finish);
    }
}
