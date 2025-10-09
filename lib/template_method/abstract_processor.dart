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