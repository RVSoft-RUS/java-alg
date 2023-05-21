package abstract_factory;

/**
 * Абстрактная фабрика, как и все фабричные паттерны, помогает нам правильно организовать создание новых объектов.
 * С ее помощью мы управляем “выпуском” различных семейств взаимосвязанных объектов.
 */
public class BuildingsExample {
//    private static final String STYLE = "Classic";
    private static final String STYLE = "Modern";

    public static void main(String[] args) {
        BuildingFactory buildingFactory;
        if (STYLE.equalsIgnoreCase("classic")) {
            buildingFactory = new ClassicBuildingFactory();
        } else if (STYLE.equalsIgnoreCase("modern")) {
            buildingFactory = new ModernBuildingFactory();
        } else {
            throw new RuntimeException("Unknown style: " + STYLE);
        }

        House house = buildingFactory.createHouse();
        School school = buildingFactory.createSchool();
    }
}

interface House {
    default void printAbout() {
        System.out.println("Create new " + this.getClass().getSimpleName());
    }
}

class ModernHouse implements House {
    public ModernHouse() {
        printAbout();
    }
}

class ClassicHouse implements House {
    public ClassicHouse() {
        printAbout();
    }
}

interface School {
    default void printAbout() {
        System.out.println("Create new " + this.getClass().getSimpleName());
    }
}

class ModernSchool implements School {
    public ModernSchool() {
        printAbout();
    }
}

class ClassicSchool implements School {
    public ClassicSchool() {
        printAbout();
    }
}

interface BuildingFactory {
    House createHouse();
    School createSchool();
}

class ModernBuildingFactory implements BuildingFactory {
    @Override
    public House createHouse() {
        return new ModernHouse();
    }

    @Override
    public School createSchool() {
        return new ModernSchool();
    }
}

class ClassicBuildingFactory implements BuildingFactory {
    @Override
    public House createHouse() {
        return new ClassicHouse();
    }

    @Override
    public School createSchool() {
        return new ClassicSchool();
    }
}