package factory_method;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public class Example {
    public static void main(String[] args) {
        List<GiftGenerator> generators = new ArrayList<>();
        generators.add(new CoinGenerator());
        generators.add(new PlatinumCoinGenerator());

        for (int i = 0; i < 10; i++) {
            System.out.println(
                    generators
                            .get(ThreadLocalRandom.current().nextInt(2))
                            .openGift()
            );
        }
    }
}

interface Gift {
    int cost();
}

class Coin implements Gift {

    // конструктор создания объекта монеты
    public Coin() {
        // логика
    }

    @Override
    public int cost() {
        return 100;
    }
}

class PlatinumCoin implements Gift {

    // конструктор создания объекта платиновой монеты
    public PlatinumCoin() {
        // логика
    }

    @Override
    public int cost() {
        return 10_000;
    }
}

interface GiftGenerator {
    default int openGift() {
        // ... что-то про логику открытия подарка ...
        Gift gift = createGift();
        return gift.cost();
    }

    /**
     * Реализации интерфейса будут сами решать как создавать подарок,
     * переопределяя этот метод. Это и есть наш фабричный метод.
     */
    Gift createGift();
}

class CoinGenerator implements GiftGenerator {
    @Override
    public Gift createGift() {
        return new Coin();
    }
}

class PlatinumCoinGenerator implements GiftGenerator {
    @Override
    public Gift createGift() {
        return new PlatinumCoin();
    }
}

/*
Выделив абстракцию подарка, фабричный метод для создания (это наши генераторы), мы получили:

Возможность гибко добавлять новые подарки, по сути просто создав необходимые генераторы, переопределяющие фабричный метод создания подарка.

Контроль над созданием подарков. Каждый генератор может по своему создавать подарок, за который ответственен.
 */