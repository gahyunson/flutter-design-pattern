import './animal.dart';

// CustomNotification noti = CustomNotification(message: "test message");

// Drug morphine = Morphine(type: "Morphine");
// Drug codeine = Codeine(type: "Codeine");
// var no = NotificationObserver();
// no.addObserver(morphine);
// no.addObserver(codeine);
// no.notifyObservers(noti);

class CustomNotification {
  String message;
  CustomNotification({required this.message});
}

class NotificationObserver {
  // List<Drug> _drugs = [];

  // void addObserver(Drug drug) {
  //   _drugs.add(drug);
  // }

  // void removeObserver(Drug drug) {
  //   _drugs.remove(drug);
  // }

  // void notifyObservers(CustomNotification notification) {
  //   for (var drug in _drugs) {
  //     drug.notify(notification.message);
  //   }
  // }
}
