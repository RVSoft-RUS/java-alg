package templatemethod;

public abstract class ElectricDevice {
    //используется во всех наследниках
    public void toggle() { //Шаблонный метод
        if (isSwitchedOn()) {
            switchOff();
        } else {
            switchOn();
        }
    }

    //Переопределяются в классах наследниках
    public abstract void switchOn();
    public abstract void switchOff();
    public abstract boolean isSwitchedOn();
}
