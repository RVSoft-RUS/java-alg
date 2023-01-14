package visitor;

import java.util.ArrayList;
import java.util.List;

public class Example {
    public static void main(String[] args) {
        Visitor v = new ElementVisitor();
        Document d = new Document(new ArrayList<>());

        d.elements.add(new JsonElement(456));
        d.elements.add(new JsonElement(567));
        d.elements.add(new JsonElement(678));
        d.elements.add(new XmlElement(1234));

        d.accept(v);
    }
}

interface Element {
    void accept(Visitor visitor);
}

interface Visitor {
    void visit(XmlElement xmlElement);
    void visit(JsonElement jsonElement);
}

class Document implements Element {
    List<Element> elements;

    public Document(List<Element> elements) {
        this.elements = elements;
    }

    @Override
    public void accept(Visitor v) {
        for (Element e : this.elements) {
            e.accept(v);
        }
    }
}

class JsonElement implements Element {
    private final int uuid;

    public JsonElement(int uuid) {
        this.uuid = uuid;
    }

    public int uuid() {
        return uuid;
    }

    public void accept(Visitor v) {
        v.visit(this);
    }
}
class XmlElement implements Element {
    private final int uuid;

    public XmlElement(int uuid) {
        this.uuid = uuid;
    }

    public int uuid() {
        return uuid;
    }

    public void accept(Visitor v) {
        v.visit(this);
    }
}

class ElementVisitor implements Visitor {

    @Override
    public void visit(XmlElement xe) {
        System.out.println(
                "processing an XML element with uuid: " + xe.uuid());
    }

    @Override
    public void visit(JsonElement je) {
        System.out.println(
                "processing a JSON element with uuid: " + je.uuid());
    }
}