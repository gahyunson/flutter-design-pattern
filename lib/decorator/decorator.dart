// Decorator Pattern
// Structural design
//
// 1. 추상 객체를 만든다
// 2. 추상 객체를 확장하여 객체를 만든다. 이것을 이용할 것이다
// 3. 앞서만든 객체에 기능을 확장하기 위한 방법으로 decorator 방법을 사용한다.
// 4. decorator 라는 것을 이용해서 기능 확장을 쉽게할 수 있다.

// Coffee americano = Americano();
// // Coffee americanoAddShot = AmericanoAddShot(americano);
// // Coffee americanoAddSugar = AmericanoAddSugar(americano);
// // print(americanoAddShot.getCoffee());
// // print(americanoAddShot.getPrice());
// // print(americanoAddSugar.getCoffee());
// // print(americanoAddSugar.getPrice());
// Coffee addShotDecorator = AmericanoAddShotDecorator(americano);
// Coffee addSugarDecorator = AmericanoAddSugarDecorator(americano);

// print(addShotDecorator.getCoffee());
// print(addSugarDecorator.getCoffee());

abstract class Coffee {
  String getCoffee();
  int getPrice();
}

class Americano implements Coffee {
  @override
  String getCoffee() {
    return "Americano o";
  }

  @override
  int getPrice() {
    return 2000;
  }
}

abstract class CoffeeDecorator implements Coffee {
  final Coffee coffee;

  CoffeeDecorator(this.coffee);

  @override
  String getCoffee() {
    return coffee.getCoffee();
  }

  @override
  int getPrice() {
    return coffee.getPrice();
  }
}

class AmericanoAddShotDecorator extends CoffeeDecorator {
  // final Coffee coffee;
  AmericanoAddShotDecorator(super.coffee);

  @override
  String getCoffee() {
    return '${super.getCoffee()} add shot';
    // return 'Americano add shot!';
  }

  @override
  int getPrice() {
    return super.getPrice() + 500;
  }
}

class AmericanoAddSugarDecorator extends CoffeeDecorator {
  AmericanoAddSugarDecorator(super.coffee);

  @override
  String getCoffee() {
    return '${super.getCoffee()} add sugar';
  }

  @override
  int getPrice() {
    return super.getPrice() + 500;
  }
}

// class AmericanoAddShot implements Coffee {
//   final Coffee coffee;

//   AmericanoAddShot(this.coffee);

//   @override
//   String getCoffee() {
//     return '${coffee.getCoffee()} 샷 추가';
//   }

//   @override
//   int getPrice() {
//     return coffee.getPrice() + 500;
//   }
// }

// class AmericanoAddSugar implements Coffee {
//   final Coffee coffee;

//   AmericanoAddSugar(this.coffee);

//   @override
//   String getCoffee() {
//     return '${coffee.getCoffee()} 설탕 추가';
//   }

//   @override
//   int getPrice() {
//     return coffee.getPrice() + 500;
//   }
// }

// Window decoratedWindow = new VerticalScrollBarDecorator(
//   new HorizontalScrollBarDecorator(new SimpleWindow()),
// );
// decoratedWindow.draw();
// print(decoratedWindow.getDescription());
//
// 원본 component
abstract class Window {
  void draw();
  String getDescription();
}

// concretecomponent
class SimpleWindow implements Window {
  @override
  void draw() {
    print('기본 창 그리기');
  }

  @override
  String getDescription() {
    return "simple window";
  }
}

// decorator class
abstract class WindowDecorator implements Window {
  final Window windowToBeDecorated; // point field
  WindowDecorator(this.windowToBeDecorated); // constructor

  @override
  void draw() {
    windowToBeDecorated.draw();
  }

  @override
  String getDescription() {
    return windowToBeDecorated.getDescription();
  }
}

// concretecomponent
class VerticalScrollBarDecorator extends WindowDecorator {
  VerticalScrollBarDecorator(super.windowToBeDecorated);

  @override
  void draw() {
    super.draw();
    drawVerticalScrollBar();
  }

  void drawVerticalScrollBar() {
    print("수직 스크롤바 그리는 중...");
  }

  @override
  String getDescription() {
    return '${super.getDescription()} , including vertical scrollbar...';
  }
}

// concretecomponent
class HorizontalScrollBarDecorator extends WindowDecorator {
  HorizontalScrollBarDecorator(Window windowToBeDecorated)
    : super(windowToBeDecorated);

  @override
  void draw() {
    super.draw();
    drawHorizontalScrollBar();
  }

  void drawHorizontalScrollBar() {
    print("수평 스크롤바 그리는 중...");
  }

  @override
  String getDescription() {
    return '${super.getDescription()}, including horizontal scrollbar...';
  }
}
