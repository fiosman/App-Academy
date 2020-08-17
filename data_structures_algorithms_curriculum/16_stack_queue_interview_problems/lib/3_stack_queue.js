// ============================================================================
// Interview Problem: StackQueue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement your preferred Stack implementation, including the methods:
//
//   - Push
//   - Pop
//   - Size
//
// Then, implement a Queue by instantiating two Stack instances for storage.
//
// The StackQueue implementation should include the following methods:
//
//   - Enqueue
//   - Dequeue
//   - Size
//
// -----------
// Let's code!
// -----------

class Node {
  // TODO: Implement the Node class!
  constructor(val) {
    this.next = null;
    this.value = val;
  }
}

class Stack {
  // TODO: Implement the Stack class!
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  size() {
    return this.length;
  }

  push(stackNode) {
    if (!this.top) {
      this.top = stackNode;
      this.bottom = stackNode;
      this.length++;
    } else {
      const currentTop = this.top;
      this.top = stackNode;
      this.top.next = currentTop;
      this.length++;
    }

    return this.size();
  }

  pop() {
    if (!this.top) return null;
    if (this.top === this.bottom) this.bottom = null;

    const currentTop = this.top;
    this.top = this.top.next;
    this.length--;
    return currentTop;
  }
}

class StackQueue {
  // TODO: Implement the StackQueue class!
  constructor() {
    this.front = null;
    this.back = null;
    this.inStack = new Stack();
    this.outStack = new Stack();
  }

  enqueue(val) {
    const newNode = new Node(val);
    if (!this.front) {
      this.front = newNode;
      this.back = newNode;
    } else {
      this.back.next = newNode;
      this.back = newNode;
    }

    this.inStack.push(new Node(newNode.value));
    return this.size();
  }

  dequeue() {
    if (!this.front) {
      return null;
    } else if (this.front === this.back) {
      this.front = null;
      this.back = null;
    } else {
      this.front = this.front.next;
    }

    if (this.outStack.size() === 0) {
      while (this.inStack.size() > 0) {
        this.outStack.push(this.inStack.pop());
      }
    }

    const ele = this.outStack.pop();
    return ele;
  }

  size() {
    return this.inStack.size() + this.outStack.size();
  }
}

exports.Node = Node;
exports.Stack = Stack;
exports.StackQueue = StackQueue;
