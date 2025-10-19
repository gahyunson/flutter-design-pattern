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
