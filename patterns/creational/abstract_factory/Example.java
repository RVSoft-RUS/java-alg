package abstract_factory;

/**
 * Абстрактная фабрика, как и все фабричные паттерны, помогает нам правильно организовать создание новых объектов.
 * С ее помощью мы управляем “выпуском” различных семейств взаимосвязанных объектов.
 */
public class Example {
    private static final String INTERIOR = "Loft";
//    private static final String INTERIOR = "Modern";

    public static void main(String[] args) {
        FunitureFactory funitureFactory;
        if (INTERIOR.equalsIgnoreCase("loft")) {
            funitureFactory = new LoftFunitureFactory();
        } else if (INTERIOR.equalsIgnoreCase("modern")) {
            funitureFactory = new ModernFunitureFactory();
        } else {
            throw new RuntimeException("Unknown interior.");
        }

        Chair chair = funitureFactory.createChair();
        Sofa sofa = funitureFactory.createSofa();
    }
}

// стулья
interface Chair {
    default void printAbout() {
        System.out.println("Create new " + this.getClass().getSimpleName());
    }
}

class ModernChair implements Chair {
    public ModernChair() {
        printAbout();
    }
}

class LoftChair implements Chair {
    public LoftChair() {
        printAbout();
    }
}

// диваны
interface Sofa {
    default void printAbout() {
        System.out.println("Create new " + this.getClass().getSimpleName());
    }
}

class ModernSofa implements Sofa {
    public ModernSofa() {
        printAbout();
    }
}

class LoftSofa implements Sofa {
    public LoftSofa() {
        printAbout();
    }
}

interface FunitureFactory {
    Chair createChair();
    Sofa createSofa();
}

class ModernFunitureFactory implements FunitureFactory {
    @Override
    public Chair createChair() {
        return new ModernChair();
    }

    @Override
    public Sofa createSofa() {
        return new ModernSofa();
    }
}

class LoftFunitureFactory implements FunitureFactory {
    @Override
    public Chair createChair() {
        return new LoftChair();
    }

    @Override
    public Sofa createSofa() {
        return new LoftSofa();
    }
}