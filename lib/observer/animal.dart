// abstract interface class Observer {
//   void update(int value);
// }

// abstract interface class Subject {
//   void attach(Observer observer);
//   void detach(Observer observer);
//   void notify();
// }

// class ConcreteSubject implements Subject {
//   final List<Observer> _observers = [];
//   int _state = 0;

//   @override
//   void attach(Observer observer) {
//     _observers.add(observer);
//   }

//   @override
//   void detach(Observer observer) {
//     _observers.remove(observer);
//   }

//   @override
//   void notify() {
//     for (var observer in _observers) {
//       observer.update(_state);
//     }
//   }
// }

// class ConcreateObserver implements Observer {
//   int state = 0;

//   @override
//   void update(int new_value) {
//     state = new_value;
//   }
// }

abstract interface class Subject {
  void addList(Observer observer);
  void removeList(Observer observer);
  void notify();
}

class Dealer implements Subject {
  List<Observer> _observers = [];

  @override
  void addList(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removeList(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notify() {
    for (var observer in _observers) {
      observer.update();
    }
  }
}

abstract interface class Observer {
  void update();
}

class Morphine implements Observer {
  void update() {
    print('Morphine is ready, Morphine');
  }
}

class Codeine implements Observer {
  void update() {
    print('Codeine is dangerous, Codeine');
  }
}
