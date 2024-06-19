// factorial_test.dart

import 'package:test/test.dart';
import 'factorial.dart';

void main() {
 group('Factorial Function', () {
    test('returns the factorial of 0', () {
      expect(factorial(0), equals(1));
    });

    test('returns the factorial of 1', () {
      expect(factorial(1), equals(1));
    });

    test('returns the factorial of 5', () {
      expect(factorial(5), equals(120));
    });

    test('throws an error for negative numbers', () {
      expect(() => factorial(-1), throwsArgumentError);
    });
 });
}
