package adapter;

import java.util.Arrays;
import java.util.Random;

public class Generators {
    public static void main(String[] args) {
        RandomGenerator randomGenerator = new RandomGenerator();
        GeneratorAdapter generatorAdapter = new GeneratorAdapter(randomGenerator);
        int[] array = generatorAdapter.generate(15);
        System.out.println(Arrays.toString(array));
    }
}

class RandomGenerator {
    public int getRandomNumber() {
        return (int) (Integer.MAX_VALUE * Math.random());
    }
}

class SequenceGenerator {
    public int[] generate(int lenth) {
        Random random = new Random();
        int[] array = new int[lenth];
        for (int i = 0; i < lenth; i++) {
            array[i] = random.nextInt();
        }
        return array;
    }
}

class GeneratorAdapter extends SequenceGenerator {
    public GeneratorAdapter(RandomGenerator randomGenerator) {
        this.randomGenerator = randomGenerator;
    }

    private RandomGenerator randomGenerator;

    @Override
    public int[] generate(int lenth) {
        int[] array = new int[lenth];
        for (int i = 0; i < lenth; i++) {
            array[i] = randomGenerator.getRandomNumber();
        }
        return array;

    }
}