import 'abstract_processor.dart';


class CSVProcessor extends DataProcessor {
  @override
  void loadData() {
    print("Loading CSV data...");
  }

  @override
  void parseData() {
    print("Parsing CSV data...");
  }
}