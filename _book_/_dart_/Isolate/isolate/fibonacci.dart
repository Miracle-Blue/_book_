import 'dart:isolate';

void main(List<String> args) {
  //! first
  // print(fib(40));

  //! second
  // final  stopwatch1 = Stopwatch()..start();
  // print(fibSmart(500));
  // print('fibSmart() executed in ${stopwatch1.elapsed}');

  //! third
  // final  stopwatch2 = Stopwatch()..start();
  // print(fibDP(500, {1: 1, 2: 1}));
  // print('fibDP() executed in ${stopwatch2.elapsed}');

  //! fourth
  // ReceivePort receivePort = ReceivePort();

  // Isolate.spawn(fibIsolate, [receivePort.sendPort, 40]);

  // receivePort.listen((message) {
  //   print(message);

  //   receivePort.close();
  // });
}

//! first
// int fib(int n) {
//   if (n <= 2) return 1;
//   return fib(n - 1) + fib(n - 2);
// }

//! second
// int fibSmart(int n) {
//   List<int> fib = [1, 1];

//   for (int i = 1; i < n - 1; i++) {
//     fib.add(fib[i] + fib[i - 1]);
//   }

//   return fib.last;
// }

//! third
// int fibDP(int n, Map<int, int> _cashe) {
//   return _cashe.putIfAbsent(
//     n,
//     () => fibDP(n - 1, _cashe) + fibDP(n - 2, _cashe),
//   );
// }

//! fourth
// void fibIsolate(List args) {
//   var list = [1, 1];

//   for (int i = 2; i < args[1]; i++) {
//     list.add(list[i - 1] + list[i - 2]);
//   }

//   args[0].send(list.last);
// }