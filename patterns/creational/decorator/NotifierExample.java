package decorator;

import java.util.Random;

public class NotifierExample {
    public static void main(String[] args) {
        MessengerNotifier messengerNotifier1 = new MessengerNotifier(
                "123456789",
                "Реализуйте паттерн «Декоратор» для отправки SMS-сообщения по номеру телефона в случае, если отправка в мессенджер не удалась. Кроме того, сообщение SMS должно быть не длиннее 160 символов."
        );
        SMSNotifier smsNotifier1 = new SMSNotifier(messengerNotifier1);
        smsNotifier1.notifySubscriber();
        MessengerNotifier messengerNotifier2 = new MessengerNotifier(
                "123456789",
                "Реализуйте паттерн «Декоратор»."
        );
        SMSNotifier smsNotifier2 = new SMSNotifier(messengerNotifier2);
        smsNotifier2.notifySubscriber();
    }
}

interface Notifier {
    boolean notifySubscriber();
}

final class MessengerNotifier implements Notifier {
    private String phone;
    private String text;

    public MessengerNotifier(String phone, String text) {
        this.phone = phone;
        this.text = text;
    }

    public String getText() {
        return text;
    }

    @Override
    public boolean notifySubscriber() {
        Random random = new Random();
        boolean res = random.nextBoolean();
        if (res) {
            System.out.println("Отправлено через мессенджер.");
        }
        return res;
    }
}

class SMSNotifier implements Notifier {
    private MessengerNotifier notifier;

    public SMSNotifier(MessengerNotifier notifier) {
        this.notifier = notifier;
    }

    @Override
    public boolean notifySubscriber() {
        if (!notifier.notifySubscriber()) {
            System.out.println("отправка в мессенджер не удалась");
        } else {
            return true;
        }
        boolean wasSend = notifier.getText().length() <= 160;
        System.out.println(wasSend ? "Отправлено по СМС" : "Не отправлено по СМС. >160 simbols");
        return wasSend;
    }
}