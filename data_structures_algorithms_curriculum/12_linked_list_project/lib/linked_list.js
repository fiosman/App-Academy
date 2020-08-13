// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
  constructor(val) {
    this.value = val;
    this.next = null;
  }
}

// TODO: Implement a Singly Linked List class here
class LinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }

  // TODO: Implement the addToTail method here
  addToTail(val) {
    const node = new Node(val);
    if (!this.head) {
      this.head = node;
    } else {
      this.tail.next = node;
    }
    this.tail = node;
    this.length++;
    return this;
  }

  // TODO: Implement the removeTail method here
  removeTail() {}

  // TODO: Implement the addToHead method here
  addToHead(val) {
    let newNode = new Node(val);

    if (this.length === 0) {
      this.head = newNode;
      this.tail = newNode;
      this.length++;
      return this;
    }

    let oldHead = this.head;
    this.head = newNode;
    this.head.next = oldHead;
    this.length++;
    return this;
  }

  // TODO: Implement the removeHead method here
  removeHead() {}

  // TODO: Implement the contains method here
  contains(target) {
    let node = this.head;
    while (node.next) {
      if (node.val === target) {
        return true;
      }
      node = node.next;
    }
    return false;
  }

  // TODO: Implement the get method here
  get(index) {}

  // TODO: Implement the set method here
  set(index, val) {}

  // TODO: Implement the insert method here
  insert(index, val) {}

  // TODO: Implement the remove method here
  remove(index) {}

  // TODO: Implement the size method here
  size() {}
}

const list = new LinkedList();

// list.addToTail(3);
// list.addToTail(2);
// console.log(list);
// list.addToHead(4);
// console.log(list);

// list.addToHead(4);
// list.addToHead(3);
// console.log(list.addToHead(5));

exports.Node = Node;
exports.LinkedList = LinkedList;
