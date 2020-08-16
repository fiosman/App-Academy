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

	enqueue() {}

	dequeue() {}
	
	size() { 
		return this.length;
	}

}

exports.Node = Node;
exports.Queue = Queue;