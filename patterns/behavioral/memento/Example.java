package memento;

/**
 * Шаблон Memento должен использоваться в любом приложении,
 * в котором состояние объекта постоянно меняется,
 * и пользователь приложения может принять решение о откате
 * или отмене изменений в любой момент.
 */
public class Example {
    public static void main(String[] args)
    {
        Article article = new Article(1, "My Article");
        article.setContent("ABC");    //original content
        System.out.println(article);

        ArticleMemento memento = article.createMemento(); //created immutable memento

        article.setContent("123");    //changed content
        System.out.println(article);

        article.restore(memento);   //UNDO change
        System.out.println(article);  //original content
    }
}

class Article
{
    private long id;
    private String title;
    private String content;

    public Article(long id, String title) {
        super();
        this.id = id;
        this.title = title;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArticleMemento createMemento()
    {
        return new ArticleMemento(id, title, content);
    }

    public void restore(ArticleMemento m) {
        this.id = m.getId();
        this.title = m.getTitle();
        this.content = m.getContent();
    }

    @Override
    public String toString() {
        return "Article [id=" + id + ", title=" + title + ", content=" + content + "]";
    }
}

final class ArticleMemento
{
    private final long id;
    private final String title;
    private final String content;

    public ArticleMemento(long id, String title, String content) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }
}