class Stack<E> {
  List<E> _storage;

  Stack() : _storage = <E>[];

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last;

  @override
  String toString() {
    return "${_storage.reversed.join('\n')}";
  }
}
