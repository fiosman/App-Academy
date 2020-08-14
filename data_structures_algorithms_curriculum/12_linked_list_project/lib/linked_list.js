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
  removeTail() {
    if (this.length === 0) return undefined;
    if (this.length === 1) {
      this.head = null;
      this.tail = null;
      this.length--;
      return;
    }
    const newTail = this.get(this.length - 2);
    const oldTail = this.tail;
    newTail.next = null;
    this.tail = newTail;
    this.length--;
    return oldTail;
  }

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
  removeHead() {
    if (this.length === 0) {
      return undefined;
    } else if (this.length === 1) {
      this.head = null;
      this.tail = null;
      this.length--;
      return;
    }

    let removedNode = this.head;
    this.head = this.head.next;
    this.length--;
    return removedNode;
  }

  // TODO: Implement the contains method here
  contains(target) {
    let node = this.head;
    while (node) {
      if (node.value === target) {
        return true;
      }
      node = node.next;
    }
    return false;
  }

  // TODO: Implement the get method here
  get(index) {
    //   if (index > this.length - 1) return null;
    let currentPos = 0;
    let currentNode = this.head;

    while (currentNode) {
      if (currentPos === index) {
        return currentNode;
      } else {
        currentNode = currentNode.next;
        currentPos++;
      }
    }
    return null;
  }

  // TODO: Implement the set method here
  set(index, val) {
    let node = this.get(index);

    if (node) {
      node.value = val;
      return true;
    } else {
      return false;
    }
  }

  // TODO: Implement the insert method here
  insert(index, val) {
    let newNode = new Node(val);

    if (index === 0) return this.addToHead(val);

    if (index - 1 < this.length - 1) {
      const prevNode = this.get(index - 1);
      const currentNodeAtIdx = prevNode.next;
      prevNode.next = newNode;
      newNode.next = currentNodeAtIdx;
      this.length++;
      return true;
    } else {
      return false;
    }
  }

  // TODO: Implement the remove method here
  remove(index) {
    if (index > this.length - 1) return undefined;
    if (index === 0) return this.removeHead();
    if (index === this.length - 1) return this.removeTail();

    const nodeBeforeTarget = this.get(index - 1);
    const target = nodeBeforeTarget.next;
    nodeBeforeTarget.next = target.next;
    this.length--;
    return target;
  }

  // TODO: Implement the size method here
  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
