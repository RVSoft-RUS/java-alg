package state;

/**
 * Основная идея шаблона состояния состоит в том, чтобы разрешить объекту изменять свое поведение
 * без изменения его класса. Кроме того, благодаря его реализации
 * код должен оставаться более чистым без множества инструкций if/else.
 *
 * Представьте, что у нас есть посылка, которая отправляется в почтовое отделение,
 * саму посылку можно заказать, затем доставить в почтовое отделение и, наконец, получить клиенту.
 * Теперь, в зависимости от фактического состояния, мы хотим распечатать его статус доставки.
 *
 * Самым простым подходом было бы добавить несколько логических флагов и применить
 * простые операторы if/else внутри каждого из наших методов в классе.
 * Это не сильно усложнит ситуацию в простом сценарии. Однако это может усложнить и загрязнить наш код,
 * когда мы получим больше состояний для обработки, что приведет к еще большему количеству операторов if/else.
 */
public class Example {
    public static void main(String[] args) {
        Package pkg = new Package();
        pkg.printStatus();

        pkg.nextState();
        pkg.printStatus();

        pkg.nextState();
        pkg.printStatus();

        pkg.nextState();
        pkg.printStatus();
        pkg.nextState();
        pkg.previousState();
        pkg.printStatus();
    }
}

class Package {

    private PackageState state = new OrderedState();

    public PackageState getState() {
        return state;
    }

    public void setState(PackageState state) {
        this.state = state;
    }

    public void previousState() {
        state.prev(this);
    }

    public void nextState() {
        state.next(this);
    }

    public void printStatus() {
        state.printStatus();
    }
}

interface PackageState {
    void next(Package pkg);
    void prev(Package pkg);
    void printStatus();
}

class OrderedState implements PackageState {

    @Override
    public void next(Package pkg) {
        pkg.setState(new DeliveredState());
    }

    @Override
    public void prev(Package pkg) {
        System.out.println("The package is in its root state.");
    }

    @Override
    public void printStatus() {
        System.out.println("Package ordered, not delivered to the office yet.");
    }
}

class DeliveredState implements PackageState {

    @Override
    public void next(Package pkg) {
        pkg.setState(new ReceivedState());
    }

    @Override
    public void prev(Package pkg) {
        pkg.setState(new OrderedState());
    }

    @Override
    public void printStatus() {
        System.out.println("Package delivered to post office, not received yet.");
    }
}

class ReceivedState implements PackageState {

    @Override
    public void next(Package pkg) {
        System.out.println("This package is already received by a client.");
    }

    @Override
    public void prev(Package pkg) {
        pkg.setState(new DeliveredState());
    }

    @Override
    public void printStatus() {
        System.out.println("Package received.");
    }
}