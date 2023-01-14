public class BinarySearch {
    public static void main(String[] args) {
        int[] vals = {1, 1, 2, 3, 4, 7, 10, 11, 15};
        int valueToFind = 11;

        System.out.println(binarySearch(vals, valueToFind, 0, vals.length - 1));
    }

    private static int binarySearch(int[] values, int valueToFind, int l, int r) {
        if (l == r) {
            return l;
        }

        int m = (l + r) / 2;
        if (valueToFind == values[m]) {
            return m;
        }
        else if(valueToFind < values[m]) {
            return binarySearch(values, valueToFind, l, m);
        } else {
            return binarySearch(values, valueToFind, m, r);
        }
    }
}
