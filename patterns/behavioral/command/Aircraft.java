package command;

import java.util.ArrayList;
import java.util.List;

/*
Написать программу, имитирующую предполетную подготовку самолета, при помощи паттерна Команда.
Необходимо создать две команды с действием запуска двигателя и поднятием закрылок.
Обе команды должны имплементировать интерфейс AircraftCommand.

В команде запуска двигателя должно быть указано количество секунд, через которое двигатель нужно запустить,
а также число оборотов, до которого его нужно довести.

А в команде поднятия закрылок — время в секундах, через которое команду нужно выполнить,
и угол, до которого их нужно поднять.

Также необходимо создать класс CommandPool, в который можно добавлять новые команды и который их по очереди исполняет,
проверяя раз в 10 миллисекунд наличие в очереди новой команды.

Класс CommandPool должен расширять класс Thread и переопределять его метод “run”, в котором должен быть цикл,
проверяющий добавление новой команды. Сами команды должны уходить на исполнение в отдельные потоки — объекты
 класса CommandExecutor, в котором должна происходить задержка выполнения и команда должна в итоге выполняться.
 */
public class Aircraft {
    public static void main(String[] args) {

    }
}

interface AircraftCommand {
    int getTimeBeforeExecute();

    int getParameter();
}

class StartEngine implements AircraftCommand {
    private int timeBeforeExecute;
    private int engineSpeed;

    public StartEngine(int timeBeforeExecute, int parameter) {
        this.timeBeforeExecute = timeBeforeExecute;
        this.engineSpeed = parameter;
    }

    @Override
    public int getTimeBeforeExecute() {
        return timeBeforeExecute;
    }

    @Override
    public int getParameter() {
        return engineSpeed;
    }
}

class RaisingFlaps implements AircraftCommand {
    private int timeBeforeExecute;
    private int angle;

    public RaisingFlaps(int timeBeforeExecute, int parameter) {
        this.timeBeforeExecute = timeBeforeExecute;
        this.angle = parameter;
    }

    @Override
    public int getTimeBeforeExecute() {
        return timeBeforeExecute;
    }

    @Override
    public int getParameter() {
        return angle;
    }
}

class CommandPool extends Thread {
    private List<AircraftCommand> commands = new ArrayList<>();

    public void addCommand(AircraftCommand command) {
        commands.add(command);
    }

    @Override
    public void run() {
        while (true) {
            try {
                sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            AircraftCommand command =commands.remove(0);
            CommandExecutor executor = new CommandExecutor(command);
            executor.start();
        }
    }
}

class CommandExecutor extends Thread {
    private AircraftCommand command;

    public CommandExecutor(AircraftCommand command) {
        this.command = command;
    }

    @Override
    public void run() {
        try {
            sleep(1000 * command.getTimeBeforeExecute());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //execute command
    }
}