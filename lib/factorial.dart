// factorial.dart

/// Calculates the factorial of a non-negative integer.
///
/// - Parameter [n]: The non-negative integer to calculate the factorial of.
/// - Returns: The factorial of [n].
int factorial(int n) {
 if (n < 0) {
    throw ArgumentError('n must be a non-negative integer');
 }
 int result = 1;
 for (int i = 1; i <= n; i++) {
    result *= i;
 }
 return result;
}
