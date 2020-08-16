const { Node, Stack } = require('../lib/stack.js');
const { expect } = require('chai');

describe('Stack', () => {
  let node;
  let stack;

  beforeEach(() => {
    stack = new Stack();
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
  
  describe('Stack Constructor', () => {
    it('Should exist', () => {
      expect(Stack).to.exist;
    });

    it('Should be a function (ES6 classes are "special functions")', () => {
      expect(Stack).to.be.a('function');
    });
    
    it('Should have top, bottom, and length properties', () => {
      expect(stack).to.have.property('top');
      expect(stack).to.have.property('bottom');
      expect(stack).to.have.property('length');
    });
  });

  describe('Stack Behavior', () => {
    it('Should remove the most recently added of three nodes (FIFO)', () => {
      stack.push('A');
      stack.push('B');
      stack.push('C');
      expect(stack.pop()).to.equal('C');
    });

    it('Should remove the newest node after newer nodes have already been added and removed', () => {
      stack.push('A');
      stack.push('B');
      stack.push('C');
      stack.push('D');
      stack.pop()
      expect(stack.pop()).to.equal('C');
    });
  });

  describe('Stack Methods', () => {
    it('Should have methods named "push", "pop", and "size"', () => {
      expect(stack.push).to.be.a('function');
      expect(stack.pop).to.be.a('function');
      expect(stack.size).to.be.a('function');
    });

    describe('push', () => {
      it('Should accept a single input parameter', () => {
        expect(stack.push.length).to.equal(1);
      });

      it('Should create a new node with the value provided as input', () => {
        stack.push('A');
        expect(stack.top.value).to.equal('A');
      });

      it('Should reassign both the top and bottom pointers when a new node is added to the top of an empty stack', () => {
        stack.push('A');
        expect(stack.top.value).to.equal('A');
        expect(stack.bottom.value).to.equal('A');
      });

      it('Should reassign only the top pointer when new nodes are added to the top of the stack of size one or greater', () => {
        stack.push('A');
        stack.push('B');
        expect(stack.top.value).to.equal('B');
        expect(stack.bottom.value).to.equal('A');
        stack.push('C');
        expect(stack.top.value).to.equal('C');
        expect(stack.bottom.value).to.equal('A');
      });

      it('Should point the next property of the top node to the node that precedes it for stacks of size one or greater', () => {
        stack.push('A');
        stack.push('B');
        expect(stack.top.next.value).to.eql('A');
        stack.push('C');
        expect(stack.top.next.value).to.equal('B');
      });

      it('Should increment the stack\'s length by one each time a node is added to the stack', () => {
        expect(stack.length).to.equal(0);
        stack.push('A');
        expect(stack.length).to.equal(1);
        stack.push('B');
        expect(stack.length).to.equal(2);
        stack.push('C');
        expect(stack.length).to.equal(3);
      });

      it('Should return the size of the stack after a new node is added to the stack', () => {
        expect(stack.push('A')).to.equal(1);
        expect(stack.push('B')).to.equal(2);
      });
    });

    describe('pop', () => {
      it('Should not accept any input parameters', () => {
        expect(stack.pop.length).to.equal(0);
      });      

      it('Should not throw an error when calling pop on an empty stack', () => {
        expect(function() {stack.pop()}).to.not.throw();
      });      

      it('Should return null if called on an empty stack', () => {
        expect(stack.pop()).to.be.equal(null);
      });      

      it('Should reassign the top and bottom pointers to null if there is only one node in the stack', () => {
        stack.push('A');
        expect(stack.top.value).to.equal('A');
        expect(stack.bottom.value).to.equal('A');
        stack.pop();
        expect(stack.top).to.equal(null);
        expect(stack.bottom).to.equal(null);
      });      

      it('Should reassign the top pointer to the node just below the top node for stacks of size two or greater', () => {
        stack.push('A');
        stack.push('B');
        stack.push('C');
        expect(stack.top.value).to.equal('C');
        stack.pop();
        expect(stack.top.value).to.equal('B');
        stack.pop();
        expect(stack.top.value).to.equal('A');
      });      

      it('Should decrement the stack\'s length by one each time a node is removed from the stack', () => {
        stack.push('A');
        stack.push('B');
        stack.push('C');
        expect(stack.length).to.equal(3);
        stack.pop();
        expect(stack.length).to.equal(2);
        stack.pop();
        expect(stack.length).to.equal(1);
      });      

      it('Should return the value of the node removed from the stack', () => {
        stack.push('A');
        stack.push('B');
        expect(stack.pop()).to.equal('B');
        expect(stack.pop()).to.equal('A');
      });            
    });

    describe('size', () => {
      it('Should return a size of 0 for a new stack', () => {
        expect(stack.size()).to.equal(0);
      });
      
      it('Should return a size of 2 after two nodes are added to the stack', () => {
        stack.push('A');
        stack.push('B');
        expect(stack.size()).to.equal(2);
      });

      it('Should return a size of 1 after two nodes are added and then one is removed', () => {
        stack.push('A');
        stack.push('B');
        stack.pop();
        expect(stack.size()).to.equal(1);
      });

      it('Should return a size of 0 after more nodes were removed than were added', () => {
        stack.push('A');
        stack.pop();
        stack.pop();
        expect(stack.size()).to.equal(0);
      });
    });
  });
});