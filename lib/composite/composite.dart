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

abstract class WindowDecorator implements Window {
  final Window windowToBeDecorated;
  WindowDecorator(this.windowToBeDecorated);

  @override
  void draw() {
    windowToBeDecorated.draw();
  }

  @override
  String getDescription() {
    return windowToBeDecorated.getDescription();
  }
}

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

// Leaf leaf1 = Leaf(1);
// Leaf leaf2 = Leaf(2);
// Composite composite1 = Composite();
// Composite composite2 = Composite();

// composite1.add(leaf1);
// composite1.add(leaf2);
// composite1.operation();

// composite2.add(leaf2);
// composite2.add(leaf2);
// composite2.operation();
abstract class Component {
  void operation();
}

class Leaf implements Component {
  int num = 0;

  Leaf(this.num);

  @override
  void operation() {
    print("Leaf $num status");
  }
}

class Composite implements Component {
  List<Component> components = [];

  void add(Component component) {
    components.add(component);
  }

  void remove(Component component) {
    components.remove(component);
  }

  @override
  void operation() {
    print("Print all Leaf... start...");
    for (var component in components) {
      component.operation();
    }
    print("...finish");
  }
}
