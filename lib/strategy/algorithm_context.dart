import 'abstract_algorithm.dart';

// Command strategy pattern run at main.dart
// final context = AlgorithmContext();
// context.setStrategy(CSVAlgorithm());
// context.executeAlgorithm();

// context.setStrategy(JsonAlgorithm());
// context.executeAlgorithm();
class AlgorithmContext {
  AbstractAlgorithm? _strategy;

  void setStrategy(AbstractAlgorithm algorithm) {
    _strategy = algorithm;
  }

  void executeAlgorithm() {
    _strategy?.process(true);
  }
}
