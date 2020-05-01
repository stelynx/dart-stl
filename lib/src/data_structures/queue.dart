import 'package:standard_library/src/data_structures/node.dart';

abstract class Queue<E> {
  /// Get first node in queue.
  SequenceNode<E> get front;

  /// Get last node in queue.
  SequenceNode<E> get back;

  /// Returns [true] if queue is empty, otherwise [false].
  bool get empty;

  /// Get the number of elements in queue.
  int get size;

  /// Add [node] to the end of the queue.
  SequenceNode<E> pushBack(SequenceNode<E> node);

  /// Get first node in the queue and remove it.
  SequenceNode<E> popFront();

  /// Add [value] to the queue by creating new [Node]
  /// and pushing it to the end.
  SequenceNode<E> enqueue(E value);

  /// Returns the value of the first [Node] in queue.
  E dequeue();

  factory Queue() = LinkedQueue<E>;
}

class LinkedQueue<E> implements Queue<E> {
  SequenceNode<E> _front;
  SequenceNode<E> _back;
  int _size = 0;

  @override
  SequenceNode<E> get front => _front;

  @override
  SequenceNode<E> get back => _back;

  @override
  bool get empty => _size == 0;

  @override
  int get size => _size;

  @override
  SequenceNode<E> pushBack(SequenceNode<E> node) {
    if (_front == null) {
      _front = node;
      _back = node;
    } else {
      _back.next = node;
      _back = node;
    }
    _size++;
    return _back;
  }

  @override
  SequenceNode<E> popFront() {
    if (_size == 0) {
      return null;
    }

    final SequenceNode<E> front = _front;
    _front = _front.next;
    _size--;
    return front;
  }

  @override
  SequenceNode<E> enqueue(E value) {
    final SequenceNode<E> node = SequenceNode<E>(value);
    return pushBack(node);
  }

  @override
  E dequeue() {
    return popFront()?.value;
  }
}
