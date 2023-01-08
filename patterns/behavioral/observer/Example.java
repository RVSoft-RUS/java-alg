package observer;

import java.util.ArrayList;
import java.util.List;

/**
 * Согласно определению GoF, шаблон наблюдателя определяет зависимость "один ко многим" между объектами, так что, когда один объект изменяет состояние, все его зависимые элементы уведомляются и обновляются автоматически. Это также называется шаблоном публикации-подписки.
 * В шаблоне наблюдателя есть много наблюдателей (объектов-подписчиков), которые наблюдают за конкретным субъектом (объектом издателя). Наблюдатели регистрируются в теме, чтобы получать уведомление о внесении изменений в эту тему.
 * Объект наблюдателя может зарегистрироваться или отменить регистрацию у субъекта в любой момент времени. Это помогает сделать объекты слабо связанными.
 */
public class Example {
    public static void main(String[] args) {
        MessageSubscriberOne s1 = new MessageSubscriberOne();
        MessageSubscriberTwo s2 = new MessageSubscriberTwo();
        MessageSubscriberThree s3 = new MessageSubscriberThree();

        MessagePublisher p = new MessagePublisher();

        p.attach(s1);
        p.attach(s2);

        p.notifyUpdate(new Message("First Message"));   //s1 and s2 will receive the update

        p.detach(s1);
        p.attach(s3);

        p.notifyUpdate(new Message("Second Message")); //s2 and s3 will receive the update
    }
}

interface Subject {
    void attach(Observer o);
    void detach(Observer o);
    void notifyUpdate(Message m);
}

class MessagePublisher implements Subject {
    private final List<Observer> observers = new ArrayList<>();

    @Override
    public void attach(Observer o) {
        observers.add(o);
    }

    @Override
    public void detach(Observer o) {
        observers.remove(o);
    }

    @Override
    public void notifyUpdate(Message m) {
        for(Observer o: observers) {
            o.update(m);
        }
    }
}

interface Observer {
    void update(Message m);
}

class MessageSubscriberOne implements Observer {
    @Override
    public void update(Message m) {
        System.out.println("MessageSubscriberOne :: " + m.getMessageContent());
    }
}

class MessageSubscriberTwo implements Observer {
    @Override
    public void update(Message m) {
        System.out.println("MessageSubscriberTwo :: " + m.getMessageContent());
    }
}

class MessageSubscriberThree implements Observer {
    @Override
    public void update(Message m) {
        System.out.println("MessageSubscriberThree :: " + m.getMessageContent());
    }
}

class Message
{
    final String messageContent;

    public Message (String m) {
        this.messageContent = m;
    }

    public String getMessageContent() {
        return messageContent;
    }
}