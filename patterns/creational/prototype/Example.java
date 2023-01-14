package prototype;

/**
 * обычно используется, когда у нас есть экземпляр класса (prototype),
 * и мы хотели бы создать новые объекты, просто скопировав прототип.
 */
public class Example {
    public static void main(String[] args) {
        PlasticTree plasticTree = new PlasticTree();
        plasticTree.setPosition(new Object());
        PlasticTree anotherPlasticTree = (PlasticTree) plasticTree.copy();
        anotherPlasticTree.setPosition(new Object());
    }
}

abstract class Tree {
    private Object position;

    // ...
    public abstract Tree copy();

    protected Object getPosition() {
        return position;
    }

    protected void setPosition(Object position) {
        this.position = position;
    }

    protected double getMass() {
        return 2d;
    }

    protected double getHeight() {
        return 3d;
    }
}

class PlasticTree extends Tree {
    public PlasticTree() {
        super();
    }

    // ...

    @Override
    public Tree copy() {
        PlasticTree plasticTreeClone = new PlasticTree();
        plasticTreeClone.setPosition(this.getPosition());
        return plasticTreeClone;
    }
}

class PineTree extends Tree {
    // ...

    @Override
    public Tree copy() {
        PineTree pineTreeClone = new PineTree();
        pineTreeClone.setPosition(this.getPosition());
        return pineTreeClone;
    }
}