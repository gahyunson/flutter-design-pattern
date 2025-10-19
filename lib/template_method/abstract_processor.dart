// Command template method pattern run at main.dart
// final csv = CSVProcessor();
// final json = JSONProcessor();

// csv.process();
// print("Above is CSV --------- Below is Json");
// json.process();

abstract class DataProcessor {
  void process() {
    loadData();
    parseData();
    saveData();
  }

  void loadData();
  void parseData();

  void saveData() {
    print("Data is saved");
  }
}
