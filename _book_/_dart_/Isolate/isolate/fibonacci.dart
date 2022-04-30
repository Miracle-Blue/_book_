import 'dart:isolate';

void main(List<String> args) {
  //! first
  // print(fibDP(40, {1: 1, 2: 1}));

  //! second
  // print(fib(40));

  //! third
  // ReceivePort receivePort = ReceivePort();

  // Isolate.spawn(fibIsolate, [receivePort.sendPort, 40]);

  // receivePort.listen((message) {
  //   print(message);

  //   receivePort.close();
  // });
}

//! first
// int fibDP(int n, Map<int, int> _cashe) {
//   return _cashe.putIfAbsent(
//       n, () => fibDP(n - 1, _cashe) + fibDP(n - 2, _cashe));
// }

//! second
// int fib(int n) {
//   if (n <= 2) return 1;
//   return fib(n - 1) + fib(n - 2);
// }

//! third
// void fibIsolate(List args) {
//   var list = [1, 1];

//   for (int i = 2; i < args[1]; i++) {
//     list.add(list[i - 1] + list[i - 2]);
//   }

//   args[0].send(list.last);
// }
