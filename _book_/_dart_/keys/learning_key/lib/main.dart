import 'package:flutter/material.dart';

import 'examples/page_storage_key_second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

//* widgetlarni joyini almashtirganda
//* scrolni eslab qolish kerak bo'lganda,
//* dismisible da
//* Hero da

// State ni olish kerak bo'lganda

//! Global Second
//! PageStorageKey Second

// state kerak bo'lsa,
// Bir xil widgetlarda holatni
// bir biriga uzatish kerak bo'lsa
//* GlobalKey();
//* GlobalObjectKey();
//* LabeledGlobalKey();

// Widgetlarni widget tree da
// to'g'ri joylashishini tamillashda
//* ObjectKey();
//* UniqueKey();
//* ValueKey();

// scrolni saqlashda
//* PageStorageKey();
