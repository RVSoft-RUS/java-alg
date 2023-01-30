import java.io.*;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/*
На стол в ряд выложены карточки, на каждой карточке написано натуральное число.
За один ход разрешается взять карточку либо с левого, либо с правого конца ряда. Всего можно сделать
k ходов. Итоговый счет равен сумме чисел на выбранных карточках.
Определите, какой максимальный счет можно получить по итогам игры.
 */
public class CountCards {
    private static int zip(List<Integer> a, List<Integer> b) {
        // Ваше решение
        int k = a.get(1);
        int max = 0;
//        int maxMask = 0; Понадобится, если нужна не просто сумма, а перечень этих элементов

        for (int i = 0; i < Math.pow(2, k); i++) {
            String s = Integer.toBinaryString(i);
            int nulls = k - s.length();
            String mask = "0".repeat(nulls).concat(s);
            int sum = getSum(b, mask);
            if (max < sum) {
                max = sum;
//                maxMask = i;
            }
        }
        return max;
    }

    private static int getSum(List<Integer> b, String mask) {
        int left = -1;
        int right = mask.length();
        int sum = 0;
        int offset = b.size() - mask.length();

        for (int i = 0; i < mask.length(); i++) {
            if (mask.charAt(i) == '0') {
                left++;
                sum += b.get(left);
            }
            if (mask.charAt(i) == '1') {
                right--;
                sum += b.get(right + offset);
            }
        }
        return sum;
    }

    public static void main(String[] args) throws IOException {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))) {
            List<Integer> a = readList(reader);
            List<Integer> b = readList(reader);
            System.out.println(zip(a, b));
        }
    }

    private static List<Integer> readList(BufferedReader reader) throws IOException {
        return Arrays.stream(reader.readLine().split(" "))
                .map(Integer::parseInt)
                .collect(Collectors.toList());
    }
}
