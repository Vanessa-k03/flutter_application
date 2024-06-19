import 'dart:math';

import 'package:flutter/material.dart';

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Permutation Analyzer'),
        ),
        body: const PermutationAnalyzer(),
      ),
    );
 }
}

class PermutationAnalyzer extends StatefulWidget {
 const PermutationAnalyzer({Key? key}) : super(key: key);

 @override
 _PermutationAnalyzerState createState() => _PermutationAnalyzerState();
}

class _PermutationAnalyzerState extends State<PermutationAnalyzer> {
 List<int> list = [1, 2, 3];
 List<List<int>> permutations = [];
 String result = '';

 void generatePermutations() {
    permutations = generatePermutationsRecursive(list);
    analyzePermutations(permutations);
 }

 List<List<int>> generatePermutationsRecursive(List<int> list) {
    if (list.isEmpty) {
      return [[]];
    }

    var result = <List<int>>[];
    var item = list.first;
    var remainingItems = list.sublist(1);

    for (var i = 0; i <= remainingItems.length; i++) {
      var permutations = generatePermutationsRecursive(remainingItems.sublist(0, i) + remainingItems.sublist(i + 1));
      for (var permutation in permutations) {
        result.add([item] + permutation);
      }
    }

    return result;
 }

 void analyzePermutations(List<List<int>> permutations) {
    int maxCycleLength = 0;
    for (var permutation in permutations) {
      int cycleLength = findMaxCycleLength(permutation);
      if (cycleLength > maxCycleLength) {
        maxCycleLength = cycleLength;
      }
    }
    setState(() {
      result = 'Maximum long cycle length in a random permutation: $maxCycleLength';
    });
 }

 int findMaxCycleLength(List<int> permutation) {
    var visited = List<bool>.filled(permutation.length, false);
    var cycleLengths = <int>[];

    for (var i = 0; i < permutation.length; i++) {
      if (!visited[i]) {
        var cycleLength = 0;
        var j = i;
        while (!visited[j]) {
          visited[j] = true;
          j = permutation[j];
          cycleLength++;
        }
        cycleLengths.add(cycleLength);
      }
    }

    return cycleLengths.reduce(max);
 }

 @override
 Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('List: $list'),
        ElevatedButton(
          onPressed: generatePermutations,
          child: const Text('Generate Permutations'),
        ),
        Text(result),
      ],
    );
 }
}
