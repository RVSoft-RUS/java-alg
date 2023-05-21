package proxy;

/**
 * Представляет объекты, которые могут контролировать другие объекты перехватывая их вызовы.
 * Можно перехватить вызов оригинального объекта.
 */
public class Example {
    public static void main(String[] args) {
        Image image = new ProxyImage("test.jpg");
        image.display();
        image.display();
    }
}

interface Image {
    void display();
}

class RealImage implements Image {
    private final String file;
    public RealImage(String file){
        this.file = file;
        load(file);
    }
    private void load(String file){
        System.out.println("Загрузка " + file);
    }
    public void display() {
        System.out.println("Просмотр " + file);
    }
}

class ProxyImage implements Image {
    private final String file;
    private RealImage image;
    public ProxyImage(String file){
        this.file = file;
    }
    public void display() {
        if(image == null){
            image = new RealImage(file);
            System.out.println("Инициализация RealImage");
        }
        System.out.println("actions before");
        image.display();
        System.out.println("actions after");
    }
}