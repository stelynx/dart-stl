abstract class Node<T> {
  T _value;

  Node(this._value);

  T get value => _value;
  set value(T value) => _value = value;

  @override
  bool operator ==(Object other) {
    return other is Node && other.value == _value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return '$runtimeType($_value)';
  }
}

class SequenceNode<T> extends Node<T> {
  SequenceNode<T> _next;

  SequenceNode(T value) : super(value);

  SequenceNode<T> get next => _next;
  set next(SequenceNode<T> node) => _next = node;

  bool hasNext() => _next != null;
}

class ChainNode<T> extends SequenceNode<T> {
  SequenceNode<T> _prev;

  ChainNode(T value) : super(value);

  SequenceNode<T> get previous => _prev;
  set previous(SequenceNode<T> previous) => _prev = previous;

  bool hasPrevious() => _prev != null;
}

class TreeNode<T> extends Node<T> {
  List<TreeNode<T>> _children;

  TreeNode(T value) : super(value);

  List<TreeNode<T>> get children => _children;
  set children(List<TreeNode<T>> children) => _children = children;

  bool isLeaf() => _children == null || _children.isEmpty;
}

class ParentAwareTreeNode<T> extends TreeNode<T> {
  TreeNode<T> _parent;

  ParentAwareTreeNode(T value) : super(value);

  TreeNode<T> get parent => _parent;
  set parent(TreeNode<T> parent) => _parent = parent;

  bool hasParent() => _parent != null;
}
