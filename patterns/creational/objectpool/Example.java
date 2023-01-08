package objectpool;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;

/**
 * использует набор инициализированных объектов, сохраняемых готовыми к использованию
 */
public class Example {
    public static void main(String[] args) {
        var pool = new OliphauntPool();
        var oliphaunt1 = pool.checkOut();
        var oliphaunt2 = pool.checkOut();
        var oliphaunt3 = pool.checkOut();
        pool.checkIn(oliphaunt1);
        pool.checkIn(oliphaunt2);
        var oliphaunt4 = pool.checkOut();
        var oliphaunt5 = pool.checkOut();
        var oliphaunt6 = pool.checkOut();
    }
}

class Oliphaunt {

    private static final AtomicInteger counter = new AtomicInteger(0);

    private final int id;

    public Oliphaunt() {
        id = counter.incrementAndGet();
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return String.format("Oliphaunt id=%d", id);
    }
}

abstract class ObjectPool<T> {
    private static final Logger log = Logger.getLogger(OliphauntPool.class.getSimpleName());
    private final Set<T> available = new HashSet<>();
    private final Set<T> inUse = new HashSet<>();

    protected abstract T create();

    public synchronized T checkOut() {
        if (available.isEmpty()) {
            available.add(create());
        }
        var instance = available.iterator().next();
        available.remove(instance);
        inUse.add(instance);
        log.info("Available objects: " + available.size() + ". Objects in use: " + inUse.size() + ".");
        return instance;
    }

    public synchronized void checkIn(T instance) {
        inUse.remove(instance);
        available.add(instance);
        log.info("Available objects: " + available.size() + ". Objects in use: " + inUse.size() + ".");
    }

    @Override
    public synchronized String toString() {
        return String.format("Pool available=%d inUse=%d", available.size(), inUse.size());
    }
}

class OliphauntPool extends ObjectPool<Oliphaunt> {
    @Override
    protected Oliphaunt create() {
        return new Oliphaunt();
    }
}