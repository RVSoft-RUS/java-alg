import java.util.ArrayList;
import java.util.List;

public class SplitString {
    private static List<String> split(String str) {
        List<String> result = new ArrayList<>();
        if (str == null || str.isEmpty()) {
            result.add(str);
            return result;
        }

        char cur;
        int pos = 0;

        for (int i = 0; i < str.length(); i++) {
            cur = str.charAt(i);
            if (cur == ' ' || i == str.length() - 1) {
                if (cur != ' '  && i == str.length() - 1) {
                    i++;
                }
                String s = str.substring(pos, i);
                if (!s.isEmpty()) {
                    result.add(s);
                }
                pos = i + 1;
            }
        }

        return result;
    }

    public static void main(String[] args) {
        List<String> list = split("funny  are  cats  ");
        System.out.println(list);
    }
}
