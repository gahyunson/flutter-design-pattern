// Ingleton ingleton = Ingleton();
// Ingleton extraIngleton = Ingleton();
// print(identical(ingleton, extraIngleton));
// ingleton.log();
class Ingleton {
  Ingleton._privateConstructor();

  static final Ingleton _instance = Ingleton._privateConstructor();

  factory Ingleton() => _instance;

  void log() {
    print("Lazy Initialization + static getter");
  }
}

// Singleton singleton = Singleton();
// Singleton extraSingleton = Singleton();
// print(identical(singleton, extraSingleton));
class FactorySingleton {
  // static variable
  static FactorySingleton? _instance;

  // private constructor
  FactorySingleton._internal();

  // factory constructor로 instance create and return.
  factory FactorySingleton() {
    // print(_instance); // null, Instance of 'FactorySingleton'
    // if (_instance == null) {
    //   _instance = FactorySingleton._internal();
    // }
    _instance ??= FactorySingleton._internal();
    return _instance!;
  }
}

// private constructor만 사용하기
// factory 사용하지 않는 경우 == 초기화가 필요없다
// PrivateSingleton p1 = PrivateSingleton.instance;
// PrivateSingleton p2 = PrivateSingleton.instance;
// print(identical(p1, p2));
class PrivateSingleton {
  // 이 때 _instance가 딱 한번 생성된된다
  PrivateSingleton._privateConstructor();
  static final PrivateSingleton _instance =
      PrivateSingleton._privateConstructor();
  static PrivateSingleton get instance => _instance;
}

// Single s1 = Single.instance;
// Single s2 = Single.instance;
// print(identical(s1, s2));
class Single {
  Single._();
  static Single get instance => Single._(); // 매번 새로운 객체가 생성됨
}

// Singleton s3 = Singleton.instance;
// Singleton s4 = Singleton.instance;
// print(identical(s3, s4));
class Singleton {
  Singleton._privateConstructor();
  static final Singleton _instance = Singleton._privateConstructor();
  static Singleton get instance => _instance;
}

// Not singleton
// Count count1 = Count();
// Count count2 = Count();
// increment(count1, "Count 1");
// increment(count2, "Count 2");
// print(identical(count1, count2));
// print(identityHashCode(count1)); // 객체의 고유한 값 (메모리 주소 접근 불가능)
// print(identityHashCode(count2));
class Count {
  int count = 0;
}

void increment(Count count, String title) {
  print('Incremented Before $title count: ${count.count}');
  count.count++;
  print('Incremented After $title count: ${count.count}');
}
