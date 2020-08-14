// ============================================================================
// Interview Problem: Reverse a Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Given a Singly Linked List, write a function that reverses the order of the
// list's nodes.
//
// Note: You are guaranteed not to receive a linked list with cycles as input.
//
// ------------
// Constraints:
// ------------ 
//
// (1) Your function must run in linear time, O(n).
// (2) You must reverse the list *in place*. (i.e. Use constant space, O(1).)
//
// ------------
// Explanation:
// ------------
//
// Given the following linked list:
//
//   First → Second → Third → Fourth → Fifth → null
//
// Should be mutated into the following list:
//
//   Fifth → Fourth → Third → Second → First → null
//
// This must be done without instantiating a NEW instance of a LinkedList.
// You must do reverse the list in place, by mutating the original input.
//
// --------
// Example:
// --------
//
// const linkedList = new LinkedList();
// linkedList.addToTail('First');
// linkedList.addToTail('Second');
// linkedList.addToTail('Third');
// linkedList.addToTail('Fourth');
// linkedList.addToTail('Fifth');
//
// Current List:  First → Second → Third → Fourth → Fifth → null
//
// const result = reverseLinkedList(root);
//
// Mutated List:  Fifth → Fourth → Third → Second → First → null
//
// result.head.value            => 'Fifth'
// result.head.next.value       => 'Fourth'
// result.tail.value            => 'First'
// result.tail.value.next       =>  null
//
// The old head is now the terminal node!
//
// -----------
// Let's code!
// -----------
function reverseLinkedList(linkedList) {
  // TODO: Implement the reverseLinkedList function!

}

// ----------------------------------------
// Given: Singly Linked List - Do Not Edit!
// ----------------------------------------
class Node {
  constructor(val) {
    this.value = val;
    this.next = null;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }

  addToTail(val) {
    const newNode = new Node(val);

    if (!this.head) {
      this.head = newNode;
    } else {
      this.tail.next = newNode;
    }

    this.tail = newNode;
    this.length++;
    return this;
  }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
exports.reverseLinkedList = reverseLinkedList;
