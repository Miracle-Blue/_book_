import 'package:flutter/material.dart';

final key = GlobalKey();
//! not key
//! with key
//! one key, one not
//! 2 pages

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Container(
                  color: Colors.green.shade100,
                  child: Foo(key: key),
                );
              case 1:
                return Container(
                  color: Colors.blue.shade100,
                  alignment: Alignment.center,
                  child: const Text('Blank Page'),
                );
              case 2:
                return Container(
                  color: Colors.red.shade100,
                  child: Foo(key: key),
                );
              default:
                throw '404';
            }
          },
        ),
      ),
    );
  }
}

class Foo extends StatefulWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue,
          onChanged: (v) {
            setState(() {
              _switchValue = v;
            });
          },
        ),
        Slider(
          value: _sliderValue,
          onChanged: (v) {
            setState(() {
              _sliderValue = v;
            });
          },
        ),
      ],
    );
  }
}
