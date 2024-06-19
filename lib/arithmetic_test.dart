// arithmetic_test.dart

import 'package:test/test.dart';
import 'arithmetic.dart';

void main() {
 group('Arithmetic Operations', () {
    test('addition', () {
      expect(add(10, 20), equals(30));
    });

    test('subtraction', () {
      expect(subtract(20, 10), equals(10));
    });

    test('multiplication', () {
      expect(multiply(10, 20), equals(200));
    });

    test('division', () {
      expect(divide(20, 10), equals(2.0));
    });
 });
}
