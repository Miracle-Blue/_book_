//! async

void main(List<String> args) {
  print("1 - ");
  print("2 - ");
  print("3 - ");
  Future.delayed(const Duration(seconds: 4), () => print("4 - "));
  print("5 - ");
}
