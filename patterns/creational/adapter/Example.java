package adapter;
/**
 * помогает объектам с несовместимыми интерфейсами работать вместе
 */

public class Example {
    public static void main(String[] args) {
        Movable bugattiVeyron = new BugattiVeyron();
        MovableAdapter bugattiVeyronAdapter = new MovableAdapterImpl(bugattiVeyron);

        System.out.println(bugattiVeyron.getSpeed());
        System.out.println(bugattiVeyronAdapter.getSpeed());
    }
}

interface Movable {
    /**
     * returns speed in MPH
     */

    double getSpeed();
}

class BugattiVeyron implements Movable {

    @Override
    public double getSpeed() {
        return 268;
    }
}

interface MovableAdapter {
    /**
     * returns speed in KM/H
      */
    double getSpeed();
}

class MovableAdapterImpl implements MovableAdapter {
    private final Movable luxuryCars;

    MovableAdapterImpl(Movable luxuryCars) {
        this.luxuryCars = luxuryCars;
    }

    @Override
    public double getSpeed() {
        return convertMPHtoKMPH(luxuryCars.getSpeed());
    }

    private double convertMPHtoKMPH(double mph) {
        return mph * 1.60934;
    }
}