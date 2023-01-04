package singleton.singleton;

public enum EnumSingleton {
    INSTANCE("Initial class info");

    private String info;

    EnumSingleton(String info) {
        this.info = info;
    }

    public EnumSingleton getInstance() {
        return INSTANCE;
    }
}
