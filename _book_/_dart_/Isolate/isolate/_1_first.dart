import 'dart:isolate';

//! first

// void main(List<String> args) {
//   print("OK, I'm counting...");
//   print(playHideAndSeekTheLongVersion());
// }

// String playHideAndSeekTheLongVersion() {
//   var counting = 0;
//   for (var i = 1; i <= 10000000000; i++) {
//     counting = i;
//   }
//   return '$counting! I`m done!';
// }

//! second
// void main(List<String> args) async {
//   print("OK, I'm counting...");
//   print(await playHideAndSeekTheLongVersion());
// }

// Future<String> playHideAndSeekTheLongVersion() async {
//   var counting = 0;
//   await Future(() {
//     for (var i = 1; i <= 10000000000; i++) {
//       counting = i;
//     }
//   });
//   return '$counting! I`m done';
// }

//! third
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
//   receivePort.listen((message) {
//     print(message);
// // 5
//     receivePort.close();
//     isolate.kill();
//   });
// }

// void playHideAndSeekTheLongVersion(SendPort sendPort) {
//   var counting = 0;
//   for (var i = 1; i <= 10000000000; i++) {
//     counting = i;
//   }
//   sendPort.send('$counting! Ready or not, here Icome!');
// }
