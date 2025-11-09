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
