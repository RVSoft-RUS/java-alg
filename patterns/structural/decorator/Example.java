package structural.decorator;

/**
 * позволяет нам динамически добавлять функциональность объекту без влияния на поведение объектов того же самого класса
 */
public class Example {
    public static void main(String[] args) {
        Shape circle = new Circle();

        System.out.println("\nОбычный круг:");
        circle.draw();

        Shape redCircle = new RedShapeDecorator(circle);

        System.out.println("\nКруг с красной границей:");
        redCircle.draw();

        Shape rectangle = new Rectangle();

        System.out.println("\nОбычный прямоугольник:");
        rectangle.draw();

        Shape redRectangle = new RedShapeDecorator(rectangle);

        System.out.println("\nПрямоугольник с красной границей:");
        redRectangle.draw();
    }
}

interface Shape {
    void draw();
}

class Circle implements Shape{
    @Override
    public void draw() {
        System.out.println("Я круг!");
    }
}

class Rectangle implements Shape{
    @Override
    public void draw() {
        System.out.println("Я прямоугольник!");
    }
}

abstract class ShapeDecorator implements Shape {

    protected Shape decoratedShape;

    //Конструктор, принимающий объект Shape
    public ShapeDecorator(Shape decoratedShape) {
        this.decoratedShape = decoratedShape;
    }

    public void draw() {
        decoratedShape.draw();
    }
}

class RedShapeDecorator extends ShapeDecorator{

    public RedShapeDecorator(Shape decoratedShape) {
        super(decoratedShape);
    }

    @Override
    public void draw() {
        decoratedShape.draw();
        setRedBorder(decoratedShape);
    }

    private void setRedBorder(Shape decoratedShape) {
        System.out.println("Сообщение от RedShapeDecorator. Цвет границы: красный");
    }
}