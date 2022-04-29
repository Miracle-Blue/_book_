double calculate<T extends num>(T a, T b) {
  return (((a + b) / 2) * 1 / 3) * 4;
}

void main(List<String> arguments) {
  final result1 = calculate(2, 3);
  final result2 = calculate(1.3, 4);
  final result3 = calculate(0, 0.3);
  final result4 = calculate(1.7, 4);

  print("$result1, $result2, $result3, $result4");
}
