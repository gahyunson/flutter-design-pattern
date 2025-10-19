/// 다중 상속
// print(EthiopiaProduct().harvest());
// print(EthiopiaProduct().roast());
// print(EthiopiaProduct().drip());
// print(EthiopiaProduct().address());
//
abstract class Coffee {
  String harvest();
  String roast();
  String drip();
}

abstract class EthiopiaCoffee extends Coffee {
  EthiopiaCoffee();

  @override
  String harvest() {
    return 'From Ethiopia';
  }

  @override
  String roast() {
    return 'At iOi';
  }

  @override
  String drip() {
    return 'By Sasake';
  }
}

mixin Beans {
  String country();
  String farm();
  double price();
  bool flight() => true;
}
mixin Shop {
  String name() => 'icoi';
  String roaster() => 'Sasake';
  String address() => 'Matuyama';
}
mixin EthiopiaBeans on EthiopiaCoffee {
  String country() => 'Ethiopia';
  String farm() => 'Gushe';
  double price() => 100.000;
}

class EthiopiaProduct extends EthiopiaCoffee with EthiopiaBeans, Shop {
  @override
  String harvest() {
    return 'From Ethiopia';
  }

  @override
  String roast() {
    return 'At iOi';
  }

  @override
  String drip() {
    return 'By Sasake';
  }
}

// print(Paul('Gahyun').age());
// print(Paul('Gahyun').cook());
// print(Paul('Gahyun').sex());
// print(Paul('Gahyun').read());
// print(Paul('Gahyun').sing());

mixin Hobby {
  String cook() => 'cooks';
  String read() => 'reads';
}

mixin Tenor on Male {
  String sing() => 'sings';
}

class Paul extends Male with Hobby, Tenor {
  Paul(super.name);

  @override
  String age() {
    return '$name is 31';
  }

  @override
  String cook() {
    return '$name ${super.cook()}';
  }
}

abstract class Person {
  Person(this.name);

  final String name;
  String sex();
  String age();
  String eat() {
    return '$name eats nothing';
  }

  String say() {
    return '$name says nothing';
  }
}

abstract class Male extends Person {
  Male(super.name);

  @override
  String sex() => '$name is a female';
}
