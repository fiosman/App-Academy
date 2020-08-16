const { Node, Stack, StackQueue } = require('../lib/3_stack_queue.js');
const { expect } = require('chai');

describe('Problem 3: StackQueue', () => {
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
                stack.push({ value: 'A', next: null });
                stack.push({ value: 'B', next: null });
                stack.push({ value: 'C', next: null });
                expect(stack.pop().value).to.equal('C');
            });

            it('Should remove the newest node after newer nodes have already been added and removed', () => {
                stack.push({ value: 'A', next: null });
                stack.push({ value: 'B', next: null });
                stack.push({ value: 'C', next: null });
                stack.push({ value: 'D', next: null });
                stack.pop()
                expect(stack.pop().value).to.equal('C');
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
                    stack.push({ value: 'A', next: null });
                    expect(stack.top.value).to.equal('A');
                });

                it('Should reassign both the top and bottom pointers when a new node is added to the top of an empty stack', () => {
                    stack.push({ value: 'A', next: null });
                    expect(stack.top.value).to.equal('A');
                    expect(stack.bottom.value).to.equal('A');
                });

                it('Should reassign only the top pointer when new nodes are added to the top of the stack of size one or greater', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    expect(stack.top.value).to.equal('B');
                    expect(stack.bottom.value).to.equal('A');
                    stack.push({ value: 'C', next: null });
                    expect(stack.top.value).to.equal('C');
                    expect(stack.bottom.value).to.equal('A');
                });

                it('Should point the next property of the top node to the node that precedes it for stacks of size one or greater', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    expect(stack.top.next.value).to.eql('A');
                    stack.push({ value: 'C', next: null });
                    expect(stack.top.next.value).to.equal('B');
                });

                it('Should increment the stack\'s length by one each time a node is added to the stack', () => {
                    expect(stack.length).to.equal(0);
                    stack.push({ value: 'A', next: null });
                    expect(stack.length).to.equal(1);
                    stack.push({ value: 'B', next: null });
                    expect(stack.length).to.equal(2);
                    stack.push({ value: 'C', next: null });
                    expect(stack.length).to.equal(3);
                });

                it('Should return the size of the stack after a new node is added to the stack', () => {
                    expect(stack.push({ value: 'A', next: null })).to.equal(1);
                    expect(stack.push({ value: 'A', next: null })).to.equal(2);
                });
            });

            describe('pop', () => {
                it('Should not accept any input parameters', () => {
                    expect(stack.pop.length).to.equal(0);
                });

                it('Should not throw an error when calling pop on an empty stack', () => {
                    expect(function () { stack.pop() }).to.not.throw();
                });

                it('Should return null if called on an empty stack', () => {
                    expect(stack.pop()).to.be.equal(null);
                });

                it('Should reassign the top and bottom pointers to null if there is only one node in the stack', () => {
                    stack.push({ value: 'A', next: null });
                    expect(stack.top.value).to.equal('A');
                    expect(stack.bottom.value).to.equal('A');
                    stack.pop();
                    expect(stack.top).to.equal(null);
                    expect(stack.bottom).to.equal(null);
                });

                it('Should reassign the top pointer to the node just below the top node for stacks of size two or greater', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    stack.push({ value: 'C', next: null });
                    expect(stack.top.value).to.equal('C');
                    stack.pop();
                    expect(stack.top.value).to.equal('B');
                    stack.pop();
                    expect(stack.top.value).to.equal('A');
                });

                it('Should decrement the stack\'s length by one each time a node is removed from the stack', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    stack.push({ value: 'C', next: null });
                    expect(stack.length).to.equal(3);
                    stack.pop();
                    expect(stack.length).to.equal(2);
                    stack.pop();
                    expect(stack.length).to.equal(1);
                });

                it('Should return the node removed from the stack', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    expect(stack.pop().value).to.equal('B');
                    expect(stack.pop().value).to.equal('A');
                });
            });

            describe('size', () => {
                it('Should return a size of 0 for a new stack', () => {
                    expect(stack.size()).to.equal(0);
                });

                it('Should return a size of 2 after two nodes are added to the stack', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    expect(stack.size()).to.equal(2);
                });

                it('Should return a size of 1 after two nodes are added and then one is removed', () => {
                    stack.push({ value: 'A', next: null });
                    stack.push({ value: 'B', next: null });
                    stack.pop();
                    expect(stack.size()).to.equal(1);
                });

                it('Should return a size of 0 after more nodes were removed than were added', () => {
                    stack.push({ value: 'A', next: null });
                    stack.pop();
                    stack.pop();
                    expect(stack.size()).to.equal(0);
                });
            });
        });
    });

    describe('StackQueue', () => {
        let stackQueue;

        beforeEach(() => {
            stackQueue = new StackQueue();
        });

        describe('StackQueue Constructor', () => {
            it('Should exist', () => {
                expect(StackQueue).to.exist;
            });

            it('Should be a function (ES6 classes are "special functions")', () => {
                expect(StackQueue).to.be.a('function');
            });

            it('Should have inStack, outStack (hint hint :P), front, and back properties', () => {
                expect(stackQueue).to.have.property('inStack');
                expect(stackQueue).to.have.property('outStack');
                expect(stackQueue).to.have.property('front');
                expect(stackQueue).to.have.property('back');
            });
        });

        describe('StackQueue Behavior', () => {
            it('Should remove the least recently added of three nodes (LIFO)', () => {
                stackQueue.enqueue('A');
                stackQueue.enqueue('B');
                stackQueue.enqueue('C');
                expect(stackQueue.dequeue().value).to.equal('A');
            });

            it('Should remove the oldest node after newer nodes have already been added and others have been removed', () => {
                stackQueue.enqueue('A');
                stackQueue.enqueue('B');
                stackQueue.enqueue('C');
                stackQueue.enqueue('D');
                stackQueue.dequeue()
                expect(stackQueue.dequeue().value).to.equal('B');
            });
        });

        describe('StackQueue Methods', () => {
            it('Should have methods named "enqueue", "dequeue", and "size"', () => {
                expect(stackQueue.enqueue).to.be.a('function');
                expect(stackQueue.dequeue).to.be.a('function');
                expect(stackQueue.size).to.be.a('function');
            });

            describe('enqueue', () => {
                it('Should accept a single input parameter', () => {
                    expect(stackQueue.enqueue.length).to.equal(1);
                });

                it('Should create a new node with the value provided as input', () => {
                    stackQueue.enqueue('A');
                    expect(stackQueue.front.value).to.equal('A');
                });

                it('Should reassign both the front and back pointers when a new node is added to the back of an empty stackQueue', () => {
                    stackQueue.enqueue('A');
                    expect(stackQueue.front.value).to.equal('A');
                    expect(stackQueue.back.value).to.equal('A');
                });

                it('Should reassign only the front pointer when new nodes are added to the back of the stackQueue of size one or greater', () => {
                    stackQueue.enqueue('A');
                    stackQueue.enqueue('B');
                    expect(stackQueue.front.value).to.equal('A');
                    expect(stackQueue.back.value).to.equal('B');
                    stackQueue.enqueue('C');
                    expect(stackQueue.front.value).to.equal('A');
                    expect(stackQueue.back.value).to.equal('C');
                });

                it('Should point the next property of the front node to the node that follows it for queues of size one or greater', () => {
                    stackQueue.enqueue('A');
                    stackQueue.enqueue('B');
                    expect(stackQueue.front.next.value).to.eql('B');
                    stackQueue.enqueue('C');
                    expect(stackQueue.front.next.value).to.equal('B');
                });

                it('Should return the size of the stackQueue after a new node is added to the stackQueue', () => {
                    expect(stackQueue.enqueue('A')).to.equal(1);
                    expect(stackQueue.enqueue('B')).to.equal(2);
                });
            });

            describe('dequeue', () => {
                it('Should not accept any input parameters', () => {
                    expect(stackQueue.dequeue.length).to.equal(0);
                });

                it('Should not throw an error when calling dequeue on an empty stackQueue', () => {
                    expect(function () { stackQueue.dequeue() }).to.not.throw();
                });

                it('Should return null if called on an empty stackQueue', () => {
                    expect(stackQueue.dequeue()).to.be.equal(null);
                });

                it('Should reassign the front and back pointers to null if there is only one node in the stackQueue', () => {
                    stackQueue.enqueue('A');
                    expect(stackQueue.front.value).to.equal('A');
                    expect(stackQueue.back.value).to.equal('A');
                    stackQueue.dequeue();
                    expect(stackQueue.front).to.equal(null);
                    expect(stackQueue.back).to.equal(null);
                });

                it('Should reassign the front pointer to the node just behind the front node for queues of size two or greater', () => {
                    stackQueue.enqueue('A');
                    stackQueue.enqueue('B');
                    stackQueue.enqueue('C');
                    expect(stackQueue.front.value).to.equal('A');
                    stackQueue.dequeue();
                    expect(stackQueue.front.value).to.equal('B');
                    stackQueue.dequeue();
                    expect(stackQueue.front.value).to.equal('C');
                });

                it('Should return the node removed from the stackQueue', () => {
                    stackQueue.enqueue('A');
                    stackQueue.enqueue('B');
                    expect(stackQueue.dequeue().value).to.equal('A');
                    expect(stackQueue.dequeue().value).to.equal('B');
                });
            });

            describe('size', () => {
                it('Should return a size of 0 for a new stackQueue', () => {
                    expect(stackQueue.size()).to.equal(0);
                });

                it('Should return a size of 2 after two nodes are added to the stackQueue', () => {
                    stackQueue.enqueue('A');
                    stackQueue.enqueue('B');
                    expect(stackQueue.size()).to.equal(2);
                });

                it('Should return a size of 1 after two nodes are added and then one is removed', () => {
                    stackQueue.enqueue('A');
                    stackQueue.enqueue('B');
                    stackQueue.dequeue();
                    expect(stackQueue.size()).to.equal(1);
                });

                it('Should return a size of 0 after more nodes were removed than were added', () => {
                    stackQueue.enqueue('A');
                    stackQueue.dequeue();
                    stackQueue.dequeue();
                    expect(stackQueue.size()).to.equal(0);
                });
            });
        });
    });
});