import 'dart:isolate';

void main(List<String> args) {
  print(fibDP(40, {1:1, 2:1}));
  print(fib(40));


  ReceivePort receivePort = ReceivePort();

  // var isolate = Isolate.spawn(fibIsolate, receivePort.sendPort);


}

int fibDP(int n, Map<int, int> _cashe) {
  return _cashe.putIfAbsent(n, () => fibDP(n - 1, _cashe) + fibDP(n - 2, _cashe));
}

int fib(int n) {
  if (n <= 2) return 1;
  return fib(n - 1) + fib(n - 2);
}

// int fibIsolate(SendPort sendPort) {

//   if (sendPort <= 2) return 1;
//   return fibIsolate(n - 1) + fibIsolate(n - 2);
// }
