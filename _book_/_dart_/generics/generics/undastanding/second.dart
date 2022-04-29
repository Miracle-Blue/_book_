num calculate(int a, int b) {
  return (((a + b) / 2) * 1 / 3) * 4;
} 

double calculateDouble(double a, double b) {
  return (((a + b) / 2) * 1 / 3) * 4;
}


void main(List<String> arguments) {
  final result1 = calculate(2, 3);
  final result2 = calculateDouble(1.1, 4.3);
  final result3 = calculateDouble(0.2, 0.1);
  final result4 = calculate(4, 4);

  print("$result1, $result2, $result3, $result4");
}