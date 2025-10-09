import 'abstract_algorithm.dart';


class AlgorithmContext {
  AbstractAlgorithm? _strategy;

  void setStrategy(AbstractAlgorithm algorithm) {
    _strategy = algorithm;
  }

  void executeAlgorithm() {
    _strategy?.process();
  }
}