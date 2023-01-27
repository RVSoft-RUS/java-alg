package structural.bridge;

/**
 * отделить абстракцию от ее реализации, чтобы они могли изменяться независимо
 * помогает уменьшить связанность классов программы
 */
public class Example {
    public static void main(String[] args) {
        Color redColor = new RedColor();
        Shape rectangle = new Rectangle(redColor);

        rectangle.draw();
    }


}

//У нас есть абстрактный класс Shape, который обобщенно описывает геометрическую фигуру:
abstract class Shape1 {
    public abstract void draw();
}

//Когда мы решим добавить фигуры треугольника и прямоугольника, мы унаследуемся от класса Shape:
class Rectangle1 extends Shape1 {
    @Override
    public void draw() {
        System.out.println("Drawing rectangle");
    }
}
class Triangle1 extends Shape1 {
    @Override
    public void draw() {
        System.out.println("Drawing triangle");
    }
}

/*
Выглядит все просто до того момента, пока мы не вводим понятие “цвета”.
То есть, у каждой фигуры будет свой цвет, от которого будет зависеть функционал метода draw().
Чтобы иметь различные реализации метода draw(), нам необходимо создать класс для каждой фигуры, соответствующий цвету.
Если три цвета, то шесть классов: TriangleBlack, TriangleGreen, TriangleRed, RectangleBlack, RectangleGreen и RectangleRed.

Шесть классов — не такая уж и большая проблема. Но! Если нам нужно будет добавить новую фигуру или цвет,
количество классов будет расти в геометрической прогрессии.

Как выйти из сложившейся ситуации? Хранение цвета в поле и перебор вариантов через условные конструкции — не лучший выход.
Хорошее решение — вывести цвет в отдельный интерфейс.
 */

//создадим интерфейс Color и три его имплементации — BlackColor, GreenColor и RedColor:
interface Color {
    void fillColor();
}
class BlackColor implements Color {
    @Override
    public void fillColor() {
        System.out.println("Filling in black color");
    }
}
class GreenColor implements Color {
    @Override
    public void fillColor() {
        System.out.println("Filling in green color");
    }
}
class RedColor implements Color {
    @Override
    public void fillColor() {
        System.out.println("Filling in red color");
    }
}

//Теперь добавим поле типа Color в класс Shape — его значение будем получать в конструкторе.
abstract class Shape {
    protected Color color;

    public Shape(Color color) {
        this.color = color;
    }

    public abstract void draw();
}

//Переменную color мы будем использовать в реализациях Shape. А это значит, что фигуры теперь могут использовать функционал интерфейса Color.
class Rectangle extends Shape {

    public Rectangle(Color color) {
        super(color);
    }

    @Override
    public void draw() {
        System.out.println("Drawing rectangle");
        color.fillColor();
    }
}