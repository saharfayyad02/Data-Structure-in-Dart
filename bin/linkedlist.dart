class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void insert(dynamic data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  // Challenge 1: Print in Reverse
  void printListInReverse() {
    _printListInReverse(head);
  }

  void _printListInReverse(Node? node) {
    if (node == null) {
      return;
    }
    _printListInReverse(node.next);
    print(node.data);
  }

  // Challenge 2: Find the Middle Node
  Node? findMiddleNode() {
    Node? slow = head;
    Node? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }

    return slow;
  }

  // Challenge 3: Reverse a Linked List
  void reverseList() {
    Node? prev = null;
    Node? current = head;
    Node? nextNode;

    while (current != null) {
      nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode;
    }

    head = prev;
  }

  // Challenge 4: Remove All Occurrences
  void removeAllOccurrences(dynamic target) {
    Node? current = head;
    Node? prev = null;

    while (current != null) {
      if (current.data == target) {
        if (prev == null) {
          // Removing the first node
          head = current.next;
        } else {
          prev.next = current.next;
        }
      } else {
        prev = current;
      }

      current = current.next;
    }
  }
}

void main(List<String> arguments) {
  LinkedList linkedList = LinkedList();
  linkedList.insert(3);
  linkedList.insert(7);
  linkedList.insert(1);
  linkedList.insert(4);
  linkedList.insert(9);
  linkedList.insert(4);

  print('Original linked list:');
  linkedList.printList();

  // Challenge 1: Print in Reverse
  print('\nLinked list in reverse:');
  linkedList.printListInReverse();

  // Challenge 2: Find the Middle Node
  Node? middleNode = linkedList.findMiddleNode();
  print('\nMiddle Node: ${middleNode?.data}');

  // Challenge 3: Reverse a Linked List
  linkedList.reverseList();
  print('\nReversed linked list:');
  linkedList.printList();

  // Challenge 4: Remove All Occurrences
  linkedList.removeAllOccurrences(4);
  print('\nLinked list after removing all occurrences of 4:');
  linkedList.printList();
}
