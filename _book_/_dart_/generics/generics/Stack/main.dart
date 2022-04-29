//! LIFO - last in first out

import 'stack_second.dart';

void main(List<String> args) {
  final stack = Stack();

  stack.push(1);
  stack.push(2);
  stack.push([1, 2, 3]);
  stack.push("so`z");

  print(stack);
}
