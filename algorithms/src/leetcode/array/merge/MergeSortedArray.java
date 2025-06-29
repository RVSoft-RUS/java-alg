package leetcode.array.merge;

public class MergeSortedArray {
//https://leetcode.com/problems/merge-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
    public static void merge(int[] nums1, int m, int[] nums2, int n) {
        if (n == 0) {
            return;
        }
        if (m == 0) {
            for (int i = 0; i < n; i++) {
                nums1[i] = nums2[i];
            }
            return;
        }

        int lastIndex = m + n - 1;
        m--;
        n--;

        while (m >= 0 && n >= 0) {
            if (nums1[m] <= nums2[n]) {
                nums1[lastIndex--] = nums2[n--];
            } else {
                nums1[lastIndex--] = nums1[m--];
            }
        }
        while (n >= 0) {
            nums1[lastIndex--] = nums2[n--];
        }
    }

    public static void main(String[] args) {
        int[] nums1 = new int[]{0};
        int[] nums2 = new int[]{1};
        merge(nums1, 0, nums2, 1);
        for (int j : nums1) {
            System.out.println(j);
        }
        System.out.println("*");

        nums1 = new int[]{1,2,3,0,0,0};
        nums2 = new int[]{2,3,4};
        merge(nums1, 3, nums2, 3);
        for (int j : nums1) {
            System.out.println(j);
        }
    }
}
