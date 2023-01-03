package collections.collector;

import java.util.*;
import java.util.function.BiFunction;
import java.util.stream.Collector;

public class Collectors {
    public static <T, R> Collector<T, ?, Optional<R>> minMax(
            Comparator<? super T> comp,
            BiFunction<? super T, ? super T, ? extends R> finisher
    ) {
        class Acc {
            T min;
            T max;
            boolean present;

            void add(T t) {
                if (present) {
                    if (comp.compare(t, min) < 0) {
                        min = t;
                    }
                    if (comp.compare(t, max) > 0) {
                        max = t;
                    }
                } else {
                    min = max = t;
                    present = true;
                }
            }

            Acc combine(Acc other) {
                if (!other.present) return this;
                if (!present) return other;
                if (comp.compare(other.min, min) < 0) {
                    min = other.min;
                }
                if (comp.compare(other.max, min) > 0) {
                    max = other.max;
                }
                return this;
            }
        }

        return Collector.of(
                Acc::new,
                Acc::add,
                Acc::combine,
                acc -> acc.present ? Optional.of(finisher.apply(acc.min, acc.max)) :
                        Optional.empty()
        );
    }

    static class User {
        private int age;
        private String name;

        public User(int age, String name) {
            this.age = age;
            this.name = name;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            User user = (User) o;
            return age == user.age && Objects.equals(name, user.name);
        }

        @Override
        public int hashCode() {
            return Objects.hash(age, name);
        }

        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        @Override
        public String toString() {
            return "User{" +
                    "age=" + age +
                    ", name='" + name + '\'' +
                    '}';
        }
    }

    public static void main(String[] args) {
        List<User> list = new ArrayList<>();
        list.add(new User(25, "Qwe"));
        list.add(new User(34, "Asdf"));
        list.add(new User(21, "Zxcvb"));
        list.add(new User(21, "Poiu"));

        Comparator<User> cmp = (o1, o2) -> {
            int len1 = o1.getName().length();
            int len2 = o2.getName().length();
            return len1 - len2;
        };

        //unused
        BiFunction<User, User, User> fin = (user, user2) -> null;

        Optional<String> result = list
                .stream()
                .collect(minMax(cmp, (min, max) -> min + "  |||  " + max));
        System.out.println(result);
    }
}
