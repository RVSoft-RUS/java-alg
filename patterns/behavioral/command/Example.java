package command;

public class Example {
    public static void main(String[] args) {
        // создаем объект, который будет использоваться
        Light light = new Light();
        // создаем объекты для всех умений объекта Light:
        Command switchUp = new TurnOnLightCommand(light);
        Command switchDown = new TurnOffLightCommand(light);

        // Создаемтся invoker, с которым мы будем непосредственно контактировать:
        Switch s = new Switch(switchUp, switchDown);

        // вот проверка этого, используем методы:
        s.flipUp();
        s.flipDown();
    }
}

/*Receiver class*/
class Light{
    public Light() {}

    public void turnOn() {
        System.out.println("The light is on");
    }

    public void turnOff() {
        System.out.println("The light is off");
    }
}

/*the Command interface*/
interface Command{
    void execute();
}

/*the Command for turning on the light*/
class TurnOnLightCommand implements Command{
    private final Light theLight;

    public TurnOnLightCommand(Light light){
        this.theLight=light;
    }

    public void execute(){
        theLight.turnOn();
    }
}

/*the Command for turning off the light*/
class TurnOffLightCommand implements Command{
    private final Light theLight;

    public TurnOffLightCommand(Light light){
        this.theLight=light;
    }

    public void execute(){
        theLight.turnOff();
    }
}

/*the Invoker class*/
class Switch {
    private final Command flipUpCommand;
    private final Command flipDownCommand;

    public Switch(Command flipUpCommand,Command flipDownCommand){
        this.flipUpCommand=flipUpCommand;
        this.flipDownCommand=flipDownCommand;
    }

    public void flipUp(){
        flipUpCommand.execute();
    }

    public void flipDown(){
        flipDownCommand.execute();
    }
}