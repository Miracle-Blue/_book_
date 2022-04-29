import 'linked_list.dart';

void _printNodesRecursively<T>(Node<T>? node) {
  if (node == null) return;

  _printNodesRecursively(node.next);

  print(node.value);
}

void printListInReverse<E>(LinkedList<E> list) {
  _printNodesRecursively(list.head);
}

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}

extension ReversibleLinkedList<E> on LinkedList<E> {
  Node<E>? get reverse {
    final tempList = LinkedList<E>();
    for (final value in this) {
      tempList.push(value);
    }
    return tempList.head;
  }
}

extension RemovableLinkedList<E> on LinkedList {
  void removeAll(E value) {
    var previous = head;
    var current = head?.next;

    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }

      previous = current;
      current = current.next;
    }

    tail = previous;
  }
}
