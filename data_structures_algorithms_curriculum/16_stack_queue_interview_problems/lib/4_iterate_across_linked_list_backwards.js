// ============================================================================
// Interview Problem: Constant Time Stack Max
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Iterate over a Singly Linked List of primitives backwards. When finished,
// return a string representing the original linked list's values backwards
// in the following format:
//
//                             'A -> B -> C -> D'
//
// ------------
// Constraints:
// ------------
//
// (1) Your function must be iterative, not recursive.
// (2) Your function must consume O(n) space.
// (3) Employee either a Stack, Queue, or some combination of the two in your
//     solution. (Implement any data structures you need, as you need them.)
//
//
// -----------
// Let's code!
// -----------

function iterateAcrossLinkedListBackwards(linkedList) {
  // TODO: Implement the iterateAcrossLinkedListBackwards function here
  let stack = new Stack();
  let currentNode = linkedList.head;
  let finalStr = "";

  while (currentNode) {
    stack.push(currentNode.value);
    currentNode = currentNode.next;
  }

  while (stack.size() > 0) {
    if (stack.size() > 1) {
      finalStr += `${stack.pop()} -> `;
    } else {
      finalStr += `${stack.pop()}`;
    }
  }

  return finalStr;
}

class Node {
  constructor(val) {
    this.next = null;
    this.value = val;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.length = 0;
  }

  push(val) {
    const node = new Node(val);
    if (!this.top) {
      this.top = node;
      this.length++;
    } else {
      const currentTop = this.top;
      this.top = node;
      this.top.next = currentTop;
      this.length++;
    }

    return this.size();
  }

  pop() {
    if (!this.top) return null;

    const removedEle = this.top;

    if (this.size() === 1) {
      this.top = null;
      this.length--;
    } else {
      this.top = this.top.next;
      this.length--;
    }

    return removedEle.value;
  }

  size() {
    return this.length;
  }
}

exports.iterateAcrossLinkedListBackwards = iterateAcrossLinkedListBackwards;
exports.Node = Node;
exports.Stack = Stack;
