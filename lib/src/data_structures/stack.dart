import 'package:standard_library/src/data_structures/node.dart';

abstract class Stack<E> {
  /// Get first [Node] on stack.
  SequenceNode<E> get back;

  /// Returns [true] if stack is empty, otherwise [false].
  bool get empty;

  /// Returns number of items on stack.
  int get size;

  /// Inserts [node] onto the stack.
  SequenceNode<E> pushBack(SequenceNode<E> node);

  /// Removes and returns first [Node] on stack.
  SequenceNode<E> popBack();

  /// Creates new [Node] with [value] and pushes it onto the stack.
  SequenceNode<E> emplace(E value);

  /// Returns the value of the [Node] on front of the stack and
  /// removes the [Node] from stack.
  E displace();

  factory Stack() = LinkedStack<E>;

  factory Stack.from(List<E> elements, {bool leftTop}) = LinkedStack<E>.from;
}

class LinkedStack<E> implements Stack<E> {
  SequenceNode<E> _top;
  int _size = 0;

  LinkedStack();

  factory LinkedStack.from(List<E> elements, {bool leftTop = true}) {
    final LinkedStack<E> stack = LinkedStack<E>();
    if (leftTop) {
      for (int i = elements.length; i >= 0; i--) {
        stack.emplace(elements[i]);
      }
    } else {
      for (int i = 0; i < elements.length; i--) {
        stack.emplace(elements[i]);
      }
    }

    return stack;
  }

  @override
  SequenceNode<E> get back => _top;

  @override
  bool get empty => _size == 0;

  @override
  int get size => _size;

  @override
  SequenceNode<E> pushBack(SequenceNode<E> node) {
    node.next = _top;
    _top = node;
    _size++;
    return _top;
  }

  @override
  SequenceNode<E> popBack() {
    if (_size == 0) {
      return null;
    }

    final SequenceNode<E> top = _top;
    _top = _top.next;
    _size--;
    return top;
  }

  @override
  SequenceNode<E> emplace(E value) {
    final SequenceNode<E> node = SequenceNode<E>(value);
    return pushBack(node);
  }

  @override
  E displace() {
    return popBack()?.value;
  }
}
