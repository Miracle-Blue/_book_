import 'package:flutter/material.dart';

//! not key
//! have PageStorageKey

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
                  child: const _Page(key: PageStorageKey(1)),
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
                  child: const _Page(key: PageStorageKey(2)),
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

class _Page extends StatelessWidget {
  const _Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Text('$index'),
        );
      },
    );
  }
}
