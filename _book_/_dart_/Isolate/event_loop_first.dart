import 'dart:async';

//! first

// void main() async {
//   Future(()=> print("this is from Event queue"));
//   scheduleMicrotask(() => print("This is from micro task queue"));
//   print("hello");
// }

//! second

// void main(List<String> args) {
//   Future.microtask(() => print("micriTack 3"));

//   print("main 1");
//   Future(() => print("Future 2"));
//   Future.microtask(() => print("micriTack 2"));

//   print("main 2");
//   Future(() => print("Future 3"));
//   Future.microtask(() => print("micriTack 1"));
// }

// Future<void> a() async {
//   await Future.delayed(Duration(seconds: 1));
//   print("Future duration a");
// }

// Future<void> b() async {
//   await Future.delayed(Duration(seconds: 1));
//   print("Future duration b");
// }

//! third

void main(List<String> args) async {
  print('main #1 of 2');

  scheduleMicrotask(() => print('microtask #1 of 3'));

  Future.delayed(new Duration(milliseconds: 1), () => print('future #1 (delayed)'));

  Future(() => print('future #2 of 4'))
      .then((_) => print('future #2a'))
      .then((_) {
    print('future #2b');
    scheduleMicrotask(() => print('microtask #0 (from future #2b)'));
  }).then((_) => print('future #2c'));

  scheduleMicrotask(() => print('microtask #2 of 3'));

  Future(() => print('future #3 of 4'))
      .then((_) => print('future #3a'))
      .then((_) => Future(() => print('future #3b (a new future)')));

  Future(() => print('future #4 of 4'));

  scheduleMicrotask(() => print('microtask #3 of 3'));

  print('main #2 of 2');
}
