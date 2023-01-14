package iterator;

/**
 * шаблон итератора предоставляет способ последовательного доступа к элементам агрегированного объекта без раскрытия его базового представления. Это поведенческий шаблон проектирования.
 *
 * Как следует из названия, итератор помогает в обходе коллекции объектов определенным образом, что полезно для клиентских приложений. Во время итерации клиентские программы могут выполнять различные другие операции с элементами в соответствии с требованиями.
 */
public class Example {
    public static void main(String[] args) {
        Topic[] topics = new Topic[5];
        topics[0] = new Topic("topic1");
        topics[1] = new Topic("topic2");
        topics[2] = new Topic("topic3");
        topics[3] = new Topic("topic4");
        topics[4] = new Topic("topic5");

        List<Topic> list = new TopicList(topics);

        Iterator<Topic> iterator = list.iterator();

        while(iterator.hasNext()) {
            Topic currentTopic = iterator.next();
            System.out.println(currentTopic.getName());
        }
    }
}

class Topic
{
    private String name;

    public Topic(String name) {
        super();
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

interface Iterator<E>
{
    void reset(); // reset to the first element

    E next(); // To get the next element

    E currentItem();  // To retrieve the current element

    boolean hasNext();  // To check whether there is any next element or not.
}

class TopicIterator implements Iterator<Topic> {

    private final Topic[] topics;
    private int position;

    public TopicIterator(Topic[] topics)
    {
        this.topics = topics;
        position = 0;
    }

    @Override
    public void reset() {
        position = 0;
    }

    @Override
    public Topic next() {
        return topics[position++];
    }

    @Override
    public Topic currentItem() {
        return topics[position];
    }

    @Override
    public boolean hasNext() {
        return position < topics.length;
    }
}

interface List<E>
{
    Iterator<E> iterator();
}

class TopicList implements List<Topic>
{
    private final Topic[] topics;

    public TopicList(Topic[] topics)
    {
        this.topics = topics;
    }

    @Override
    public Iterator<Topic> iterator() {
        return new TopicIterator(topics);
    }
}