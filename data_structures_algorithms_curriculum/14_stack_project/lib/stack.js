// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
  constructor(val) {
    this.next = null;
    this.value = val;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  pop() {
    if (this.length === 0) return null;
    if (this.top === this.bottom) this.bottom = null;
    const nodeRemoved = this.top;
    this.top = this.top.next;
    this.length--;
    return nodeRemoved.value;
  }

  push(val) {
    const node = new Node(val);
    if (this.length === 0) {
      this.top = node;
      this.bottom = node;
      this.length++;
    } else {
      const currentTop = this.top;
      this.top = node;
      this.top.next = currentTop;
      this.length++;
    }

    return this.length;
  }

  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.Stack = Stack;
