import 'package:flutter/material.dart';

class ExampleInheritedModelStart extends StatelessWidget {
  const ExampleInheritedModelStart({Key? key}) : super(key: key);

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
  var _valueOne = 0;
  var _valueTwo = 0;

  void _incrementOne() {
    _valueOne += 1;
    setState(() {});
  }

  void _incrementTwo() {
    _valueTwo += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _incrementOne,
          child: const Text("Tap - 1"),
        ),
        ElevatedButton(
          onPressed: _incrementTwo,
          child: const Text("Tap - 2"),
        ),
        DataProviderInherit(
          valueOne: _valueOne,
          valueTwo: _valueTwo,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value =
        context.dependOnInheritedWidgetOfExactType<DataProviderInherit>()?.valueOne ??
            0;
    return Column(
      children: [
        Text("$value"),
        const DataConsumerStateFull(),
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
    final value =
        context.dependOnInheritedWidgetOfExactType<DataProviderInherit>()?.valueTwo ??
            0;
    return Text("$value");
  }
}

class DataProviderInherit extends InheritedWidget {
  final int valueOne;
  final int valueTwo;

  const DataProviderInherit({
    Key? key,
    required this.valueOne,
    required this.valueTwo,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataProviderInherit old) {
    return valueOne != old.valueOne || valueTwo != old.valueTwo;
  }
}
