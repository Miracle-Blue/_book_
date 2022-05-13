import 'dart:isolate';

//! first

// void main(List<String> args) {
//   print("OK, I'm counting...");
//   print(playHideAndSeekTheLongVersion());
//   print("end");
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
//   print("end");
// }

// Future<String> playHideAndSeekTheLongVersion() async {
//   var counting = 0;
//   await Future(() {
//     for (var i = 1; i <= 10000000000; i++) {
//       counting = i;
//     }
//   });
//   return '$counting! I`m done';
//}

