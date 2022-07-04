// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//! with identifier
//! not identifier

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
                  child: const _Page(key: ValueKey(1)),
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
                  child: const _Page(key: ValueKey(2)),
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

class _Page extends StatefulWidget {
  const _Page({Key? key}) : super(key: key);

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  final _controller = TextEditingController();

  void setupValuePersistence() {
    final key = widget.key;

    if (key == null) return;

    final identifier = _MyPageStorageIdentifier(key, 'text');

    final dynamic value = PageStorage.of(context)?.readState(
      context,
      identifier: identifier,
    );

    _controller.text = value is String ? value : '';

    _controller.addListener(() {
      PageStorage.of(context)?.writeState(
        context,
        _controller.text,
        identifier: identifier,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setupValuePersistence();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyPageStorageIdentifier {
  final Key key;
  final String text;

  _MyPageStorageIdentifier(this.key, this.text);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _MyPageStorageIdentifier &&
        other.key == key &&
        other.text == text;
  }

  @override
  int get hashCode => key.hashCode ^ text.hashCode;
}
