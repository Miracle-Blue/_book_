import 'dart:isolate';

//! first
// void main(List<String> args) {
//   Isolate.spawn(isolateFunction, "Hello world");
//   print("hello main");
// }

// void isolateFunction(String message) {
//   Future.delayed(Duration(seconds: 1));
//   print(message);
// }

//! second
// void main(List<String> args) {
//   print("main Isolate 1");

//   Isolate.spawn(funcIsolate, "1");
//   Isolate.spawn(funcIsolate, "2");
//   Isolate.spawn(funcIsolate, "3");

//   print("main Isolate 2");
//   print("main Isolate 3");
// }

// void funcIsolate(String message) {
//   print("Created new Isolate $message");
// }

//! third
// void main() {
//   Isolate.spawn<IsolateModel>(heavyTask, IsolateModel(355000, 500));
// }

// void heavyTask(IsolateModel model) {
//   int total = 0;

//   for (int i = 1; i < model.iteration; i++) {
//     total += (i * model.multiplier);
//   }

//   print("FINAL: $total");
// }

// class IsolateModel {
//   IsolateModel(this.iteration, this.multiplier);

//   final int iteration;
//   final int multiplier;
// }

//! fourth
// void main(List<String> args) async {
//   var receivePost = ReceivePort();

//   var isolate = await Isolate.spawn(funcIsolate, receivePost.sendPort);

//   receivePost.listen((message) {
//     if (message is List) {

//     } else if (message is String && message == 'something') {

//     } else {
//       receivePost.close();
//       isolate.kill();
//     }
//   });
// }

// void funcIsolate(SendPort sendPort) async {
//   sendPort.send("hello from FuncIsolate");
// }

//! fifth
// Future<void> main() async {
// // 1
//   final receivePort = ReceivePort();
// // 2
//   final isolate = await Isolate.spawn(
//     playHideAndSeekTheLongVersion,
// // 3
//     receivePort.sendPort,
//   );
// // 4
//   receivePort.listen((Object? message) {
//     if (message == 100000000) {
//       print('if -- 1');
//     } else if (message == 10000000000) {
//       print('if -- 2');
//     } else {
//       print('if -- 3');
// // 5
//       receivePort.close();
//       isolate.kill();
//     }
//   });
// }

// void playHideAndSeekTheLongVersion(SendPort sendPort) {
//   var counting = 0;
//   for (var i = 1; i <= 100000000; i++) {
//     counting = i;
//   }
//   sendPort.send(counting);

//   for (var i = 1; i <= 10000000000; i++) {
//     counting = i;
//   }

//   sendPort.send(counting);

//   for (var i = 1; i <= 100000; i++) {
//     counting = i;
//   }

//   sendPort.send(counting);
// }
