import 'package:standard_library/standard_library.dart';
import 'package:test/test.dart';

void main() {
  group('front', () {
    test('should return null when empty', () {
      final Queue<int> queue = Queue<int>();

      expect(queue.front, isNull);
    });

    test('should return first added element without removing', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);

      expect(queue.front.value, equals(1));
      expect(queue.size, equals(2));
    });
  });

  group('back', () {
    test('should return null when empty', () {
      final Queue<int> queue = Queue<int>();

      expect(queue.back, isNull);
    });

    test('should return last added element without removing', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);

      expect(queue.back.value, equals(2));
      expect(queue.size, equals(2));
    });
  });

  group('empty', () {
    test('should return true when empty', () {
      final Queue<int> queue = Queue<int>();

      expect(queue.empty, isTrue);

      queue.enqueue(1);
      queue.dequeue();

      expect(queue.empty, isTrue);
    });

    test('should return false when not empty', () {
      final Queue<int> queue = Queue<int>();

      queue.enqueue(1);

      expect(queue.empty, isFalse);
    });
  });

  group('size', () {
    test('should be initially 0', () {
      final Queue<int> queue = Queue<int>();

      expect(queue.size, isZero);
    });

    test('should change when adding items to the queue', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);

      expect(queue.size, equals(1));
    });

    test('should decrease when removing items from queue', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.dequeue();

      expect(queue.size, isZero);
    });
  });

  group('pushBack', () {
    test('should set front and back equal when queue was empty', () {
      final Queue<int> queue = Queue<int>();
      final SequenceNode<int> node = SequenceNode<int>(1);
      queue.pushBack(node);

      expect(queue.front, equals(queue.back));
    });

    test('should increase size', () {
      final Queue<int> queue = Queue<int>();
      final SequenceNode<int> node = SequenceNode<int>(1);
      queue.pushBack(node);

      expect(queue.size, equals(1));
    });

    test('should push to the end of queue', () {
      final Queue<int> queue = Queue<int>();
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      final SequenceNode<int> node2 = SequenceNode<int>(2);
      queue.pushBack(node1);
      queue.pushBack(node2);

      expect(queue.front, equals(node1));
      expect(queue.back, equals(node2));
    });

    test('should return back node', () {
      final Queue<int> queue = Queue<int>();
      final SequenceNode<int> node = SequenceNode<int>(1);
      final SequenceNode<int> returned = queue.pushBack(node);

      expect(returned, equals(node));
    });
  });

  group('popFront', () {
    test('should return null when queue empty', () {
      final Queue<int> queue = Queue<int>();

      expect(queue.popFront(), isNull);
      expect(queue.size, isZero);
    });

    test('should return first added element', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);

      expect(queue.popFront().value, equals(1));
    });

    test('should descrease size', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.popFront();

      expect(queue.size, isZero);
    });
  });

  group('enqueue', () {
    test('should set front and back equal when queue was empty', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);

      expect(queue.front, equals(queue.back));
    });

    test('should increase size', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);

      expect(queue.size, equals(1));
    });

    test('should push to the end of queue', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);

      expect(queue.front.value, equals(1));
      expect(queue.back.value, equals(2));
    });

    test('should return back node', () {
      final Queue<int> queue = Queue<int>();
      final SequenceNode<int> node = SequenceNode<int>(1);
      final SequenceNode<int> returned = queue.enqueue(1);

      expect(returned, equals(node));
    });
  });

  group('dequeue', () {
    test('should return null when queue empty', () {
      final Queue<int> queue = Queue<int>();

      expect(queue.dequeue(), isNull);
      expect(queue.size, isZero);
    });

    test('should return first added element', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.enqueue(2);

      expect(queue.dequeue(), equals(1));
    });

    test('should descrease size', () {
      final Queue<int> queue = Queue<int>();
      queue.enqueue(1);
      queue.dequeue();

      expect(queue.size, isZero);
    });
  });

  test('should work as expected', () {
    final Queue<int> queue = Queue<int>();

    final List<int> values = <int>[1, 2, 3, 4];
    values.forEach((int value) => queue.enqueue(value));
    expect(queue.size, equals(values.length));

    final SequenceNode<int> node = queue.popFront();
    expect(node.value, equals(1));
    expect(queue.size, equals(values.length - 1));

    final List<SequenceNode<int>> nodes = <SequenceNode<int>>[
      SequenceNode<int>(5),
      SequenceNode<int>(6),
    ];
    nodes.forEach((SequenceNode<int> node) => queue.pushBack(node));
    expect(queue.size, equals(values.length + nodes.length - 1));

    queue.popFront();
    final SequenceNode<int> node2 = queue.popFront();
    expect(node2.value, equals(values[2]));
  });
}
