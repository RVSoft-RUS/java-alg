package proxy;

public class MailExample {
    public static void main(String[] args) {
//Вам необходимо реализовать интерфейс MailSender и класс-заместитель,
// который вместо отправки на основной адрес отправляет письма на сервисный.
    }
}
interface MailSender {
    boolean send(String subject, String body, String email);
}
class Mailer implements MailSender {
    @Override
    public boolean send(String subject, String body, String email) {
        //sending mail
        return true;
    }
}
class ProxyMailer implements MailSender {
    private final MailSender mailSender;
    private final String serviceEmail;

    public ProxyMailer(MailSender mailSender, String serviceEmail) {
        this.mailSender = mailSender;
        this.serviceEmail = serviceEmail;
    }

    @Override
    public boolean send(String subject, String body, String email) {
        return mailSender.send(subject, body, serviceEmail);
    }
}