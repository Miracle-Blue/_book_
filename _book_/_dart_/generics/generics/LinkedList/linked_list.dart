export 'methods_for_linkedList.dart';

class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return "$value";
    return "$value -> ${next.toString()}";
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail!.next = Node(value: value);

    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }

    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;

    if (isEmpty) {
      tail = null;
    }

    return value;
  }

  E? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;

    if (node.next == tail) {
      tail = node;
    }

    node.next = node.next?.next;

    return value;
  }

  // Iterable<E> get reversed {
  //   return;
  // }

  E? get middle {
    return elementAt(length ~/ 2);
  }

  @override
  String toString() {
    return "${head.toString()}";
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  final LinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  _LinkedListIterator(LinkedList<E> list) : _list = list;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;
  }
}
