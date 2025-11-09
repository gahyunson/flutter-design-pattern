abstract interface class AbstractAlgorithm {
  void process(bool isData);
}

// final type = 1;

// final context = AlgorithmContext();
// switch (type) {
//   case 1:
//     context.setStrategy(CSVAlgorithm());
//     break;
//   case 2:
//     context.setStrategy(JsonAlgorithm());
//     break;
// }
// context.executeAlgorithm();
