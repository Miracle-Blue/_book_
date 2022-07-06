import 'package:flutter/material.dart';

class ExampleInheritedWidgetEnd extends StatelessWidget {
  const ExampleInheritedWidgetEnd({Key? key}) : super(key: key);

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
    _value += 1;
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
        DataProviderInherit(
          value: _value,
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
    //! first method
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherit>()
            ?.value ??
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
    //! second method
    final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherit>();
    if (element != null) {
      context.dependOnInheritedElement(element);
    }
    final dataProvider = element?.widget as DataProviderInherit;
    final value = dataProvider.value;
    return Text("$value");
  }
}

class DataProviderInherit extends InheritedWidget {
  final int value;

  const DataProviderInherit({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataProviderInherit old) {
    return value != old.value;
  }
}
