// ============================================================================
// Implementation Exercise: Queue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Queue and all of its methods below!
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

class Queue {
  constructor() {
    this.front = null;
    this.back = null;
    this.length = 0;
  }

  enqueue(val) {
    const node = new Node(val);
    if (this.length === 0) {
      this.front = node;
      this.back = node;
      this.length++;
    } else {
			this.back.next = node;
			this.back = node;
      this.length++;
    }

    return this.length;
  }

  dequeue() {
    if (this.length === 0) {
      return null;
    }

    const removedFront = this.front;

    if (removedFront === this.back) {
      this.back = null;
      this.front = null;
      this.length--;
      return removedFront.value;
    } else {
      this.front = this.front.next;
      this.length--;
      return removedFront.value;
    }
  }

  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.Queue = Queue;
