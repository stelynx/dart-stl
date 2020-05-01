import 'package:standard_library/standard_library.dart';
import 'package:test/test.dart';

void main() {
  group('SequenceNode', () {
    test('should have value and next', () {
      final SequenceNode<int> node1 = SequenceNode<int>(1);
      expect(node1.value, equals(1));

      final SequenceNode<int> node2 = SequenceNode<int>(2);
      expect(node1.hasNext(), isFalse);

      node1.next = node2;
      expect(node1.hasNext(), isTrue);
      expect(node1.next, equals(node2));
    });
  });

  group('ChainNode', () {
    test('should have value and next', () {
      final ChainNode<int> node1 = ChainNode<int>(1);
      expect(node1.value, equals(1));

      final ChainNode<int> node2 = ChainNode<int>(2);
      expect(node1.hasNext(), isFalse);

      node1.next = node2;
      expect(node1.hasNext(), isTrue);
      expect(node1.next, equals(node2));
    });

    test('should have previous', () {
      final ChainNode<int> node1 = ChainNode<int>(1);
      final ChainNode<int> node2 = ChainNode<int>(2);
      expect(node1.hasPrevious(), isFalse);
      expect(node2.hasPrevious(), isFalse);

      node2.previous = node1;
      expect(node2.hasPrevious(), isTrue);
      expect(node2.previous, equals(node1));
    });
  });

  group('TreeNode', () {
    test('should have children', () {
      final TreeNode<int> node = TreeNode<int>(1);
      expect(node.isLeaf(), isTrue);

      node.addChild(TreeNode<int>(2));
      expect(node.isLeaf(), isFalse);
      expect(node.children.length, equals(1));

      node.children = <TreeNode<int>>[TreeNode<int>(3), TreeNode<int>(4)];
      expect(node.children.length, equals(2));

      node.children = <TreeNode<int>>[];
      expect(node.isLeaf(), isTrue);
    });
  });

  group('ParentAwareTreeNode', () {
    test('should have children', () {
      final ParentAwareTreeNode<int> node = ParentAwareTreeNode<int>(1);
      expect(node.isLeaf(), isTrue);

      node.addChild(ParentAwareTreeNode<int>(2));
      expect(node.isLeaf(), isFalse);
      expect(node.children.length, equals(1));

      node.children = <ParentAwareTreeNode<int>>[
        ParentAwareTreeNode<int>(3),
        ParentAwareTreeNode<int>(4)
      ];
      expect(node.children.length, equals(2));

      node.children = <ParentAwareTreeNode<int>>[];
      expect(node.isLeaf(), isTrue);
    });

    test('should be parent aware', () {
      final ParentAwareTreeNode<int> parentNode = ParentAwareTreeNode<int>(1);
      final ParentAwareTreeNode<int> childNode = ParentAwareTreeNode<int>(2);
      expect(childNode.hasParent(), isFalse);

      parentNode.addChild(childNode);
      expect(childNode.hasParent(), isTrue);
      expect(childNode.parent, equals(parentNode));
    });
  });
}
