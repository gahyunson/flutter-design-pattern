abstract class Snacks {
  void use();
}

class ConcreateSnackA implements Snacks {
  @override
  void use() {
    print('ConcreateSnackA is used');
  }
}

class ConcreateSnackB implements Snacks {
  @override
  void use() {
    print('ConcreateSnackB is used');
  }
}

abstract class Creator {
  Snacks factoryMethod();

  void operation() {
    final snack = factoryMethod();
    snack.use();
  }
}

class ConcreateCreatorA extends Creator {
  @override
  Snacks factoryMethod() {
    return ConcreateSnackA();
  }
}

// ConcreateProductA productA = ConcreateProductA();
// productA.create();
class Product {
  int id = 0;
  String name = '';
}

class ConcreateProductA {
  void create() {
    Product p = Product();
    p.id = 1;
    p.name = 'Rebar';
    print('Product A is created: ${p.id} - ${p.name}');
  }
}
