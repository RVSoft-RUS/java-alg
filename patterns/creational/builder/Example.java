package builder;

public class Example {
    Telephone telephone = Telephone.builder()
            .mark("Sony")
            .serialnumber(123)
            .build();
}

class Telephone {
    private int serialnumber;
    private String name;
    private String screenName;
    private String mark;

    private Telephone() {

    }

    public class Builder {

        private Builder() {
        }

        public Builder name(String name) {
            Telephone.this.name = name;

            return this;
        }

        public Builder screenName(String screenName) {
            Telephone.this.screenName = screenName;

            return this;
        }

        public Builder mark(String mark) {
            Telephone.this.mark = mark;
            return this;

        }

        public Builder serialnumber(int serialnumber) {
            Telephone.this.serialnumber = serialnumber;

            return this;
        }

        public Telephone build() {
            return Telephone.this;
        }
    }

    public static Builder builder() {
        return new Telephone().new Builder();
    }
}