abstract class Queue {
  bool enqueue(int element);
  int? dequeue();
  bool get isEmpty;
  int? get peek;
}

class QueueList implements Queue {
  final _list = <int>[];

  @override
  int? dequeue() => isEmpty ? null : _list.removeAt(0);

  @override
  bool enqueue(element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  int? get peek => isEmpty ? null : _list.first;

  @override
  String toString() => _list.reversed.toString();
}
