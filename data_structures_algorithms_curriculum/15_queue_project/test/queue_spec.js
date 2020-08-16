const { Node, Queue } = require('../lib/queue.js');
const { expect } = require('chai');

describe('Queue', () => {
  let node;
  let queue;

  beforeEach(() => {
    queue = new Queue();
  }); 

  describe('Node Constructor', () => {
    it('Should exist', () => {
      expect(Node).to.exist;
    });

    it('Should be a function (ES6 classes are "special functions")', () => {
      expect(Node).to.be.a('function');
    });

    it('Should have "value" and "next" properties', () => {
      node = new Node('A');
      expect(node).to.have.property('value');
      expect(node).to.have.property('next');
    });
  });
  
  describe('Queue Constructor', () => {
    it('Should exist', () => {
      expect(Queue).to.exist;
    });

    it('Should be a function (ES6 classes are "special functions")', () => {
      expect(Queue).to.be.a('function');
    });
    
    it('Should have front, back, and length properties', () => {
      expect(queue).to.have.property('front');
      expect(queue).to.have.property('back');
      expect(queue).to.have.property('length');
    });
  });

  describe('Queue Behavior', () => {
    it('Should remove the least recently added of three nodes (LIFO)', () => {
      queue.enqueue('A');
      queue.enqueue('B');
      queue.enqueue('C');
      expect(queue.dequeue()).to.equal('A');
    });

    it('Should remove the oldest node after newer nodes have already been added and others have been removed', () => {
      queue.enqueue('A');
      queue.enqueue('B');
      queue.enqueue('C');
      queue.enqueue('D');
      queue.dequeue()
      expect(queue.dequeue()).to.equal('B');
    });
  });

  describe('Queue Methods', () => {
    it('Should have methods named "enqueue", "dequeue", and "size"', () => {
      expect(queue.enqueue).to.be.a('function');
      expect(queue.dequeue).to.be.a('function');
      expect(queue.size).to.be.a('function');
    });

    describe('enqueue', () => {
      it('Should accept a single input parameter', () => {
        expect(queue.enqueue.length).to.equal(1);
      });

      it('Should create a new node with the value provided as input', () => {
        queue.enqueue('A');
        expect(queue.front.value).to.equal('A');
      });

      it('Should reassign both the front and back pointers when a new node is added to the back of an empty queue', () => {
        queue.enqueue('A');
        expect(queue.front.value).to.equal('A');
        expect(queue.back.value).to.equal('A');
      });

      it('Should reassign only the front pointer when new nodes are added to the back of the queue of size one or greater', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        expect(queue.front.value).to.equal('A');
        expect(queue.back.value).to.equal('B');
        queue.enqueue('C');
        expect(queue.front.value).to.equal('A');
        expect(queue.back.value).to.equal('C');
      });

      it('Should point the next property of the front node to the node that follows it for queues of size one or greater', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        expect(queue.front.next.value).to.eql('B');
        queue.enqueue('C');
        expect(queue.front.next.value).to.equal('B');
      });

      it('Should increment the queue\'s length by one each time a node is added to the queue', () => {
        expect(queue.length).to.equal(0);
        queue.enqueue('A');
        expect(queue.length).to.equal(1);
        queue.enqueue('B');
        expect(queue.length).to.equal(2);
        queue.enqueue('C');
        expect(queue.length).to.equal(3);
      });

      it('Should return the size of the queue after a new node is added to the queue', () => {
        expect(queue.enqueue('A')).to.equal(1);
        expect(queue.enqueue('B')).to.equal(2);
      });
    });

    describe('dequeue', () => {
      it('Should not accept any input parameters', () => {
        expect(queue.dequeue.length).to.equal(0);
      });      

      it('Should not throw an error when calling dequeue on an empty queue', () => {
        expect(function() {queue.dequeue()}).to.not.throw();
      });      

      it('Should return null if called on an empty queue', () => {
        expect(queue.dequeue()).to.be.equal(null);
      });      

      it('Should reassign the front and back pointers to null if there is only one node in the queue', () => {
        queue.enqueue('A');
        expect(queue.front.value).to.equal('A');
        expect(queue.back.value).to.equal('A');
        queue.dequeue();
        expect(queue.front).to.equal(null);
        expect(queue.back).to.equal(null);
      });      

      it('Should reassign the front pointer to the node just behind the front node for queues of size two or greater', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        queue.enqueue('C');
        expect(queue.front.value).to.equal('A');
        queue.dequeue();
        expect(queue.front.value).to.equal('B');
        queue.dequeue();
        expect(queue.front.value).to.equal('C');
      });      

      it('Should decrement the queue\'s length by one each time a node is removed from the queue', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        queue.enqueue('C');
        expect(queue.length).to.equal(3);
        queue.dequeue();
        expect(queue.length).to.equal(2);
        queue.dequeue();
        expect(queue.length).to.equal(1);
      });      

      it('Should return the value of the node removed from the queue', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        expect(queue.dequeue()).to.equal('A');
        expect(queue.dequeue()).to.equal('B');
      });            
    });

    describe('size', () => {
      it('Should return a size of 0 for a new queue', () => {
        expect(queue.size()).to.equal(0);
      });
      
      it('Should return a size of 2 after two nodes are added to the queue', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        expect(queue.size()).to.equal(2);
      });

      it('Should return a size of 1 after two nodes are added and then one is removed', () => {
        queue.enqueue('A');
        queue.enqueue('B');
        queue.dequeue();
        expect(queue.size()).to.equal(1);
      });

      it('Should return a size of 0 after more nodes were removed than were added', () => {
        queue.enqueue('A');
        queue.dequeue();
        queue.dequeue();
        expect(queue.size()).to.equal(0);
      });
    });
  });
});