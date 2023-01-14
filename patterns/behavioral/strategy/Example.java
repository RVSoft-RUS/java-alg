package strategy;

import java.util.logging.Logger;

/**
 * позволяет нам изменять поведение алгоритма во время выполнения.
 */
public class Example {
    private static final Logger LOGGER = Logger.getLogger(Example.class.getName());

    public static void main(String[] args) {
        Computer computer = new Computer(new Video());
        computer.runTask();

        computer.setNewTask(new Music());
        computer.runTask();

        computer.setNewTask(new Game());
        computer.runTask();

        Computer functionalComputer = new Computer(
                () -> LOGGER.info("Write program")
        );
        functionalComputer.runTask();

        functionalComputer = new Computer(
                () -> LOGGER.info("Execute some code and get some output")
        );
        functionalComputer.runTask();
    }
}

class Computer {
    private ComputerStrategy strategy;

    public Computer(ComputerStrategy strategy){
        this.strategy = strategy;
    }

    public void setNewTask(ComputerStrategy strategy){
        this.strategy = strategy;
    }

    public void runTask() {
        this.strategy.execute();
    }
}

@FunctionalInterface
interface ComputerStrategy {
    void execute();
}

class Video implements ComputerStrategy {
    private static final Logger LOGGER = Logger.getLogger(Video.class.getName());

    @Override
    public void execute() {
        LOGGER.info("Video playing");
    }
}

class Music implements ComputerStrategy {
    private static final Logger LOGGER = Logger.getLogger(Music.class.getName());

    @Override
    public void execute() {
        LOGGER.info("Music playing");
    }
}

class Game implements ComputerStrategy {
    private static final Logger LOGGER = Logger.getLogger(Game.class.getName());

    @Override
    public void execute() {
        LOGGER.info("Gaming now");
    }
}