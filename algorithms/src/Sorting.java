import java.util.Arrays;

public class Sorting {
    public static void main(String[] args) {
        int [] mas = {11, 3, 14, 16, 7, 0};

        bubbleSort(mas);
        System.out.println(Arrays.toString(mas));

    }

    /**
     * Сортировка пузырьком
     * @param mas Массив целых чисел, который необходимо отсортировать
     */
    private static void bubbleSort(int [] mas) {
        boolean isSorted = false;
        int buf;
        while(!isSorted) {
            isSorted = true;
            for (int i = 0; i < mas.length-1; i++) {
                if(mas[i] > mas[i+1]){
                    isSorted = false;

                    buf = mas[i];
                    mas[i] = mas[i+1];
                    mas[i+1] = buf;
                }
            }
        }
    }
}
