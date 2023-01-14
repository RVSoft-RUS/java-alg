package mediator;

import java.util.HashMap;
import java.util.Map;

/**
 * Этот шаблон определяет отдельный объект (посредник),
 * который инкапсулирует взаимодействие между набором объектов,
 * и объекты делегируют свое взаимодействие объекту-посреднику
 * вместо того, чтобы взаимодействовать друг с другом напрямую.
 */
public class Example {
    public static void main(String[] args) {
        IChatRoom chatroom = new ChatRoom();

        User user1 = new ChatUser(chatroom,"1", "Alex");
        User user2 = new ChatUser(chatroom,"2", "Brian");
        User user3 = new ChatUser(chatroom,"3", "Charles");
        User user4 = new ChatUser(chatroom,"4", "David");

        chatroom.addUser(user1);
        chatroom.addUser(user2);
        chatroom.addUser(user3);
        chatroom.addUser(user4);

        user1.send("Hello brian", "2");
        user2.send("Hey buddy", "1");
    }
}

//Mediator Interface
interface IChatRoom
{
    void sendMessage(String msg, String userId);
    void addUser(User user);
}

//Concrete Mediator
class ChatRoom implements IChatRoom {
    private final Map<String, User> usersMap = new HashMap<>();

    @Override
    public void sendMessage(String msg, String userId)
    {
        User u = usersMap.get(userId);
        u.receive(msg);
    }

    @Override
    public void addUser(User user) {
        this.usersMap.put(user.getId(), user);
    }
}

//Colleague Class
abstract class User
{
    private final IChatRoom mediator;

    private final String id;
    private final String name;

    public User(IChatRoom room, String id, String name){
        this.mediator = room;
        this.name = name;
        this.id = id;
    }

    public abstract void send(String msg, String userId);
    public abstract void receive(String msg);

    public IChatRoom getMediator() {
        return mediator;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}

//Concrete Colleagues
class ChatUser extends User {

    public ChatUser(IChatRoom room, String id, String name) {
        super(room, id, name);
    }

    @Override
    public void send(String msg, String userId) {
        System.out.println(this.getName() + " :: Sending Message : " + msg);
        getMediator().sendMessage(msg, userId);
    }

    @Override
    public void receive(String msg) {
        System.out.println(this.getName() + " :: Received Message : " + msg);
    }
}