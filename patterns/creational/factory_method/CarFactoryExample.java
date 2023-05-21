package factory_method;

import java.time.LocalDateTime;

public class CarFactoryExample {
    public static void main(String[] args) {
        CarFactory carFactory = new CarFactory();
        Car car1 = carFactory.getCar(CarType.JEEP);
        Car car2 = carFactory.getCar(CarType.SEDAN);
    }
}
interface Car {
    int getWeight();
    LocalDateTime getDateCreation();
    double engineCapacity();
}
class Sedan implements Car {
    private int weight;
    private LocalDateTime dateCreation;
    private double engineCapacity;

    public Sedan(int weight, LocalDateTime dateCreation, double engineCapacity) {
        this.weight = weight;
        this.dateCreation = dateCreation;
        this.engineCapacity = engineCapacity;
    }

    @Override
    public int getWeight() {
        return weight;
    }

    @Override
    public LocalDateTime getDateCreation() {
        return dateCreation;
    }

    @Override
    public double engineCapacity() {
        return engineCapacity;
    }
}class Jeep implements Car {
    private int weight;
    private LocalDateTime dateCreation;
    private double engineCapacity;

    public Jeep(int weight, LocalDateTime dateCreation, double engineCapacity) {
        this.weight = weight;
        this.dateCreation = dateCreation;
        this.engineCapacity = engineCapacity;
    }

    @Override
    public int getWeight() {
        return weight;
    }

    @Override
    public LocalDateTime getDateCreation() {
        return dateCreation;
    }

    @Override
    public double engineCapacity() {
        return engineCapacity;
    }
}
enum CarType {
    JEEP,
    SEDAN
}
class CarFactory {
    public Car getCar(CarType type) {
        Car car = null;
        switch (type) {
            case JEEP:
                car = new Jeep(2500, LocalDateTime.now(), 2.7);
                break;
            case SEDAN:
                car = new Sedan(1550, LocalDateTime.now(), 1.6);
                break;
            default:
                throw new IllegalArgumentException("Wrong type: " + type);
        }
        return car;
    }
}