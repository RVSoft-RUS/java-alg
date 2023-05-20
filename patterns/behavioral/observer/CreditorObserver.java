package observer;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class CreditorObserver {

    public static void main(String[] args) {
        Creditor creditor1 = new Creditor(1, "one");
        Creditor creditor2 = new Creditor(2, "two");

        Subject1 bank = new Bank();
        bank.attach(creditor1);
        bank.attach(creditor2);

        bank.notifyUpdate();
    }
}

interface Observer1 {
    void notifyCreditor();
}

interface Subject1 {
    void attach(Observer1 o);

    void detach(Observer1 o);

    void notifyUpdate();
}

class Bank implements Subject1 {
    private final Map<Observer1, LocalDate> observers = new HashMap<>();

    @Override
    public void attach(Observer1 o) {
        observers.put(o, LocalDate.now());
    }

    @Override
    public void detach(Observer1 o) {
        observers.remove(o);
    }

    @Override
    public void notifyUpdate() {
        LocalDate critical = LocalDate.now().minusMonths(1);
        observers.entrySet().stream()
                .filter(o -> o.getValue().isBefore(critical))
                .map(Map.Entry::getKey)
                .forEach(Observer1::notifyCreditor);
    }
}

class Creditor implements Observer1 {
    private final int idNumber;
    private final String name;

    Creditor(int idNumber, String name) {
        this.idNumber = idNumber;
        this.name = name;
    }

    public int getIdNumber() {
        return idNumber;
    }

    public String getName() {
        return name;
    }

    @Override
    public void notifyCreditor() {
        System.out.println("Creditor " + name + " with id " + idNumber + " must pay!!!");
    }
}
