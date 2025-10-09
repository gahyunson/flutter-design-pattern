import 'abstract_algorithm.dart';


class AllAlgorithm implements AbstractAlgorithm {
  @override
  void process(bool isData) {
    if (isData) {
      print("csv algorithm");
    } else {
      print("json algorithm");
    }
  }
}