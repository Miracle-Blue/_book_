class Stack {
  List<int> _storage;

  Stack() : _storage = <int>[];

  bool get isEmypt => _storage.isEmpty;

  bool get isNotEmpty => !isEmypt;

  void push(int element) => _storage.add(element);

  int pop() => _storage.removeLast();

  int get peek => _storage.last;

  @override
  String toString() {
    return "${_storage.reversed.join('\n')}";
  }
}
