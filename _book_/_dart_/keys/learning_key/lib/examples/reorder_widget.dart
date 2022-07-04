import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  var ints = List<String>.generate(10, (index) => index.toString());

  void _onReorder(int from, int to) {
    setState(() {
      if (from < to) {
        to -= 1;
      }

      final element = ints.removeAt(from);
      ints.insert(to, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView.builder(
          itemBuilder: (context, index) {
            return GreenBox(key: GlobalKey());
          },
          itemCount: ints.length,
          onReorder: _onReorder,
        ),
      ),
    );
  }
}

class GreenBox extends StatefulWidget {
  const GreenBox({Key? key}) : super(key: key);

  @override
  State<GreenBox> createState() => _GreenBoxState();
}

class _GreenBoxState extends State<GreenBox> {
  var _text = 'start';
  // var isDeactivated = false;
  // var isDisposed = false;

  void _changeText(String text) {
    _text = text;
    setState(() {});
  }

  // _GreenBoxState() {
  //   print('GreenBox state init ----------');
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print('GreenBox initState');
  // }

  @override
  Widget build(BuildContext context) {
    // print(
    //     'GreenBox build isDeactivated: $isDeactivated, isDisposed: $isDisposed');

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            _text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: _changeText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void deactivate() {
  //   print('GreenBox deactivate');
  //   super.deactivate();
  // }
}
