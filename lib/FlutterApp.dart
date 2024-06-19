import 'dart:math';

class PermutationAnalyzer {
 // Problem 1: Generate a random permutation of numbers from 1 to n
 static List<int> generateRandomPermutation(int n) {
    var rng = Random();
    var list = List<int>.generate(n, (i) => i + 1);
    for (var i = n - 1; i > 0; i--) {
      var j = rng.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
    return list;
 }

 // Problem 2: Decompose the permutation into disjoint cycles
 static List<List<int>> decomposeIntoCycles(List<int> permutation) {
    var visited = List<bool>.filled(permutation.length, false);
    var cycles = <List<int>>[];
    for (var i = 0; i < permutation.length; i++) {
      if (!visited[i]) {
        var cycle = <int>[];
        var j = i;
        while (!visited[j]) {
          visited[j] = true;
          cycle.add(j + 1); // +1 to match 1-based indexing
          j = permutation[j] - 1; // -1 to match 0-based indexing
        }
        cycles.add(cycle);
      }
    }
    return cycles;
 }

 // Problem 3: Calculate the maximal length of cycles
 static int findMaximalCycleLength(List<List<int>> cycles) {
    var maxLength = 0;
    for (var cycle in cycles) {
      if (cycle.length > maxLength) {
        maxLength = cycle.length;
      }
    }
    return maxLength;
 }

 // Problem 4: Monte Carlo simulation
 static double monteCarloSimulation(int n, int N) {
    var totalMaxLength = 0;
    for (var i = 0; i < N; i++) {
      var permutation = generateRandomPermutation(n);
      var cycles = decomposeIntoCycles(permutation);
      totalMaxLength += findMaximalCycleLength(cycles);
    }
    return totalMaxLength / N;
 }
}

void main() {
 var n = 100; // Length of permutation
 var N = 10000; // Number of simulations
 var result = PermutationAnalyzer.monteCarloSimulation(n, N);
 print('Expected length for the maximum long cycle: $result');
}
