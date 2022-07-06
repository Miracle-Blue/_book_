import 'package:flutter/material.dart';

class ExampleInheritedWidgetStart extends StatelessWidget {
  const ExampleInheritedWidgetStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: DataOwnerStateFull(),
        ),
      ),
    );
  }
}

class DataOwnerStateFull extends StatefulWidget {
  const DataOwnerStateFull({Key? key}) : super(key: key);

  @override
  State<DataOwnerStateFull> createState() => _DataOwnerStateFullState();
}

class _DataOwnerStateFullState extends State<DataOwnerStateFull> {
  var _value = 0;

  void _increment() {
    _value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _increment,
          child: const Text("Tap"),
        ),
        const DataConsumerStateless(),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "0",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        DataConsumerStateFull(),
      ],
    );
  }
}

class DataConsumerStateFull extends StatefulWidget {
  const DataConsumerStateFull({Key? key}) : super(key: key);

  @override
  State<DataConsumerStateFull> createState() => _DataConsumerStateFullState();
}

class _DataConsumerStateFullState extends State<DataConsumerStateFull> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "0",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }
}
