import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExampleInheritedWidgetApp extends StatelessWidget {
  const ExampleInheritedWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApiProvider(
      api: Api(),
      child: const HomePage(),
    );
  }
}

class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

  ApiProvider({
    Key? key,
    required this.api,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  static ApiProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>();
  }

  static ApiProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<ApiProvider>()?.widget;
    return widget is ApiProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(ApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }
}

class HomePage extends StatefulWidget {
  static const id = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueKey _textKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ApiProvider.watch(context)!.api.dateAndTime ?? ''),
      ),
      body: GestureDetector(
        onTap: () async {
          final api = ApiProvider.read(context)!.api;
          final dateAndTime = await api.getDateAndTime();
          setState(() {
            _textKey = ValueKey(dateAndTime);
          });
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: DateTimeWidget(
            key: _textKey,
          ),
        ),
      ),
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.watch(context)!.api;
    return Text(api.dateAndTime ?? 'Tap on screen to fetch date and time');
  }
}

class Api {
  String? dateAndTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => DateTime.now().toIso8601String(),
    ).then((value) {
      dateAndTime = value;
      return dateAndTime!;
    });
  }
}
