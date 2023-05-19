package strategy;

import java.util.Arrays;

public class Sorter {
    public static void main(String[] args) {
        int[] mas = {3, 24, 45, 2, 65, 11, 6, 4, 78, 41};

        Sorter sorter = new Sorter(new MergeSort());
        if (mas.length < 100) {
            sorter.setSortable(new BubbleSort());
        }

        mas = sorter.sort(mas);
        System.out.println(Arrays.toString(mas));
    }
    private Sortable sortable;

    public Sorter(Sortable sortable) {
        this.sortable = sortable;
    }

    public void setSortable(Sortable sortable) {
        this.sortable = sortable;
    }

    public int[] sort(int[] mas) {
        return sortable.sort(mas);
    }
}

interface Sortable {
    int[] sort(int[] mas);
}

class BubbleSort implements Sortable {
    @Override
    public int[] sort(int[] mas) {
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
        return mas;
    }
}

class MergeSort implements Sortable {

    @Override
    public int[] sort(int[] mas) {
        int[] buffer1 = Arrays.copyOf(mas, mas.length);
        int[] buffer2 = new int[mas.length];
        return mergesortInner(buffer1, buffer2, 0, mas.length);
    }

    private int[] mergesortInner(int[] buffer1, int[] buffer2,
                                       int startIndex, int endIndex) {
        if (startIndex >= endIndex - 1) {
            return buffer1;
        }

        // уже отсортирован.
        int middle = startIndex + (endIndex - startIndex) / 2;
        int[] sorted1 = mergesortInner(buffer1, buffer2, startIndex, middle);
        int[] sorted2 = mergesortInner(buffer1, buffer2, middle, endIndex);

        // Слияние
        int index1 = startIndex;
        int index2 = middle;
        int destIndex = startIndex;
        int[] result = sorted1 == buffer1 ? buffer2 : buffer1;
        while (index1 < middle && index2 < endIndex) {
            result[destIndex++] = sorted1[index1] < sorted2[index2]
                    ? sorted1[index1++] : sorted2[index2++];
        }
        while (index1 < middle) {
            result[destIndex++] = sorted1[index1++];
        }
        while (index2 < endIndex) {
            result[destIndex++] = sorted2[index2++];
        }
        return result;
    }
}
