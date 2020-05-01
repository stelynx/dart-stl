import 'package:standard_library/standard_library.dart';
import 'package:test/test.dart';

void main() {
  group('back', () {
    test('should return null when stack is empty', () {
      final Stack<int> stack = Stack<int>();

      expect(stack.back, isNull);
    });

    test('should return the latest added node', () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      final SequenceNode<int> node2 = SequenceNode<int>(2);
      stack.pushBack(node1);
      stack.pushBack(node2);

      expect(stack.back, equals(node2));
    });
  });

  group('size', () {
    test('should return 0 initially', () {
      final Stack<int> stack = Stack<int>();

      expect(stack.size, equals(0));
    });

    test('should be increased when item is added', () {
      final Stack<int> stack = Stack<int>();
      stack.emplace(1);

      expect(stack.size, equals(1));
    });

    test('should be decreased when item is removed', () {
      final Stack<int> stack = Stack<int>();
      stack.emplace(1);
      stack.displace();

      expect(stack.size, equals(0));
    });
  });

  group('empty', () {
    test('should return true when empty', () {
      final Stack<int> stack = Stack<int>();

      expect(stack.empty, isTrue);
    });

    test('should return false when not empty', () {
      final Stack<int> stack = Stack<int>();
      stack.emplace(1);

      expect(stack.empty, isFalse);
    });
  });

  group('pushBack', () {
    test('should add item on top of stack', () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node = SequenceNode<int>(1);

      stack.pushBack(node);

      expect(stack.back, equals(node));
    });

    test('should return the newly added node linked to previous top', () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      final SequenceNode<int> node2 = SequenceNode<int>(2);

      stack.pushBack(node1);
      final SequenceNode<int> pushedNode = stack.pushBack(node2);

      expect(pushedNode.next, equals(node1));
    });

    test('should increase size', () {
      final Stack<int> stack = Stack<int>();
      final int oldSize = stack.size;
      final SequenceNode<int> node = SequenceNode<int>(1);

      stack.pushBack(node);

      expect(stack.size, equals(oldSize + 1));
    });
  });

  group('popBack', () {
    test('should return null when stack empty', () {
      final Stack<int> stack = Stack<int>();

      expect(stack.popBack(), isNull);
      expect(stack.size, isZero);
    });

    test('should return the latest added item', () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      final SequenceNode<int> node2 = SequenceNode<int>(2);

      stack.pushBack(node1);
      stack.pushBack(node2);

      expect(stack.popBack(), equals(node2));
    });

    test('should reassign top element', () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      final SequenceNode<int> node2 = SequenceNode<int>(2);

      stack.pushBack(node1);
      stack.pushBack(node2);
      stack.popBack();

      expect(stack.back, equals(node1));
    });

    test('should decrease size', () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      final SequenceNode<int> node2 = SequenceNode<int>(2);

      stack.pushBack(node1);
      stack.pushBack(node2);
      final int oldSize = stack.size;
      stack.popBack();

      expect(stack.size, equals(oldSize - 1));
    });
  });

  group('emplace', () {
    test('should create and insert node and also return newly created node',
        () {
      final Stack<int> stack = Stack<int>();
      final SequenceNode<int> node = SequenceNode<int>(1);
      final SequenceNode<int> topNode = stack.emplace(1);

      expect(stack.size, equals(1));
      expect(stack.back, equals(node));
      expect(topNode, equals(node));
    });
  });

  group('displace', () {
    test('should return null when empty', () {
      final Stack<int> stack = Stack<int>();

      expect(stack.displace(), isNull);
    });

    test('should remove top node and return its value', () {
      final Stack<int> stack = Stack<int>();
      final int value = 1;
      stack.emplace(value);

      final int returnedValue = stack.displace();

      expect(stack.size, equals(0));
      expect(returnedValue, equals(value));
    });
  });

  test('should work as expected', () {
    final Stack<int> stack = Stack<int>();
    final List<int> values = <int>[1, 2, 3, 4];

    values.forEach((int value) => stack.emplace(value));
    expect(stack.size, equals(values.length));

    final int displaced = stack.displace();
    expect(stack.size, equals(values.length - 1));
    expect(displaced, equals(values[values.length - 1]));

    final List<SequenceNode<int>> nodes = <SequenceNode<int>>[
      SequenceNode<int>(5),
      SequenceNode<int>(6),
    ];
    nodes.forEach((SequenceNode<int> node) => stack.pushBack(node));
    final SequenceNode<int> node = stack.popBack();
    expect(stack.size, equals(values.length + nodes.length - 2));
    expect(node, equals(nodes[nodes.length - 1]));
    expect(stack.back, equals(nodes[nodes.length - 2]));
  });
}
