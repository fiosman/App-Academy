// ============================================================================
// Interview Problem: Linked List Cycles
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Given a Singly Linked List, write a function that returns true if the linked
// list contains a cycle, or false if terminates somewhere.
//
// ------------
// Constraints:
// ------------ 
//
// (1) Your function must run in linear time, O(n).
// (2) Your function must use constant space, O(1).
// (3) Do not mutate the linked list or it's nodes in any way.
// 
// ------------
// Explanation:
// ------------
//
// In general, we assume that a linked list is said to "terminate" at it's tail.
// This means that the linked list's tail should have a next pointer that points
// to null. For example:
// 
//                           A → B → C → D → E → null
// 
// A "cycle" occurs when there exists a node in the list whose next pointer
// points to a node that appeard previously in the list. Traversing a cyclical
// list results in an infinite loop, where one visits the same nodes (those
// LinkedIn to the cycle...see what I did there? :P) again and again.
//
// --------
// Example:
// --------
//
// Let's create the following linked list with a four-node cycle:
//
//                         A → B → C
//                             ↑   ↓
//                             E ← D
// 
// const linkedList = new LinkedList();
// let secondNode;
//
// linkedList.addToTail('A');
// linkedList.addToTail('B');
// linkedList.addToTail('C');
// linkedList.addToTail('D');
// linkedList.addToTail('E');
// hasCycle(linkedList);               => false
//
// secondNode = linkedList.get(1);
// linkedList.tail.next = secondNode;
// hasCycle(linkedList);               => true
//
// -----------
// Let's code!
// -----------
function hasCycle(linkedList) {
  // TODO: Implement the hasCycle function!

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

  get(index) {
    if (index < 0 || index >= this.length) return null;
    let counter = 0;
    let current = this.head;
    while (counter !== index) {
      current = current.next;
      counter++;
    }
    return current;
  }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
exports.hasCycle = hasCycle;
