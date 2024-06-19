class PermutationAnalyzer {
 List<List<int>> generatePermutations(List<int> list) {
    if (list.isEmpty) {
      return [[]];
    }

    var result = <List<int>>[];
    var item = list.first;
    var remainingItems = list.sublist(1);

    for (var i = 0; i <= remainingItems.length; i++) {
      var permutations = generatePermutations(remainingItems.sublist(0, i) + remainingItems.sublist(i + 1));
      for (var permutation in permutations) {
        result.add([item] + permutation);
      }
    }

    return result;
 }

 void analyzePermutations(List<List<int>> permutations) {
    // Implement your analysis logic here.
    // For example, you might want to print each permutation:
    for (List<int> permutation in permutations) {
      print(permutation);
    }
 }
}

void main() {
 PermutationAnalyzer analyzer = PermutationAnalyzer();
 List<int> list = [1, 2, 3];
 List<List<int>> permutations = analyzer.generatePermutations(list);
 analyzer.analyzePermutations(permutations);
}
