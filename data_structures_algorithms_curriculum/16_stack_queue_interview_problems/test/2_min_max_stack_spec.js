const { Node, MinMaxStack } = require('../lib/2_min_max_stack.js');
const { expect } = require('chai');


describe('Problem 2: MinMaxStack', () => {
    describe('MinMaxStack', () => {
        let node;
        let minMaxStack;

        beforeEach(() => {
            minMaxStack = new MinMaxStack();
        });

        describe('Node Constructor', () => {
            it('Should exist', () => {
                expect(Node).to.exist;
            });

            it('Should be a function (ES6 classes are "special functions")', () => {
                expect(Node).to.be.a('function');
            });

            it('Should have "value" and "next" properties', () => {
                node = new Node(1);
                expect(node).to.have.property('value');
                expect(node).to.have.property('next');
            });
        });

        describe('MinMaxStack Constructor', () => {
            it('Should exist', () => {
                expect(minMaxStack).to.exist;
            });

            it('Should be a function (ES6 classes are "special functions")', () => {
                expect(MinMaxStack).to.be.a('function');
            });

            it('Should AT LEAST (hint hint) have top, bottom, and length properties', () => {
                expect(minMaxStack).to.have.property('top');
                expect(minMaxStack).to.have.property('bottom');
                expect(minMaxStack).to.have.property('length');
            });
        });

        describe('MinMaxStack Behavior', () => {
            it('Should remove the most recently added of three nodes (FIFO)', () => {
                minMaxStack.push(1);
                minMaxStack.push(2);
                minMaxStack.push(3);
                expect(minMaxStack.pop().value).to.equal(3);
            });

            it('Should remove the newest node after newer nodes have already been added and removed', () => {
                minMaxStack.push(1);
                minMaxStack.push(2);
                minMaxStack.push(3);
                minMaxStack.push(4);
                minMaxStack.pop()
                expect(minMaxStack.pop().value).to.equal(3);
            });
        });

        describe('MinMaxStack Methods', () => {
            it('Should have methods named "push", "pop","size", "min", and "max"', () => {
                expect(minMaxStack.push).to.be.a('function');
                expect(minMaxStack.pop).to.be.a('function');
                expect(minMaxStack.size).to.be.a('function');
                expect(minMaxStack.min).to.be.a('function');
                expect(minMaxStack.max).to.be.a('function');
            });

            describe('push', () => {
                it('Should accept a single input parameter', () => {
                    expect(minMaxStack.push.length).to.equal(1);
                });

                it('Should create a new node with the value provided as input', () => {
                    minMaxStack.push(1);
                    expect(minMaxStack.top.value).to.equal(1);
                });

                it('Should reassign both the top and bottom pointers when a new node is added to the top of an empty MinMaxStack', () => {
                    minMaxStack.push(1);
                    expect(minMaxStack.top.value).to.equal(1);
                    expect(minMaxStack.bottom.value).to.equal(1);
                });

                it('Should reassign only the top pointer when new nodes are added to the top of the MinMaxStack of size one or greater', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.top.value).to.equal(2);
                    expect(minMaxStack.bottom.value).to.equal(1);
                    minMaxStack.push(3);
                    expect(minMaxStack.top.value).to.equal(3);
                    expect(minMaxStack.bottom.value).to.equal(1);
                });

                it('Should point the next property of the top node to the node that precedes it for MinMaxStacks of size one or greater', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.top.next.value).to.eql(1);
                    minMaxStack.push(3);
                    expect(minMaxStack.top.next.value).to.equal(2);
                });

                it('Should increment the MinMaxStack\'s length by one each time a node is added to the MinMaxStack', () => {
                    expect(minMaxStack.length).to.equal(0);
                    minMaxStack.push(1);
                    expect(minMaxStack.length).to.equal(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.length).to.equal(2);
                    minMaxStack.push(3);
                    expect(minMaxStack.length).to.equal(3);
                });

                it('Should return the size of the MinMaxStack after a new node is added to the MinMaxStack', () => {
                    expect(minMaxStack.push(1)).to.equal(1);
                    expect(minMaxStack.push(1)).to.equal(2);
                });
            });

            describe('pop', () => {
                it('Should not accept any input parameters', () => {
                    expect(minMaxStack.pop.length).to.equal(0);
                });

                it('Should not throw an error when calling pop on an empty MinMaxStack', () => {
                    expect(function () { minMaxStack.pop() }).to.not.throw();
                });

                it('Should return null if called on an empty MinMaxStack', () => {
                    expect(minMaxStack.pop()).to.be.equal(null);
                });

                it('Should reassign the top and bottom pointers to null if there is only one node in the MinMaxStack', () => {
                    minMaxStack.push(1);
                    expect(minMaxStack.top.value).to.equal(1);
                    expect(minMaxStack.bottom.value).to.equal(1);
                    minMaxStack.pop();
                    expect(minMaxStack.top).to.equal(null);
                    expect(minMaxStack.bottom).to.equal(null);
                });

                it('Should reassign the top pointer to the node just below the top node for MinMaxStacks of size two or greater', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.push(3);
                    expect(minMaxStack.top.value).to.equal(3);
                    minMaxStack.pop();
                    expect(minMaxStack.top.value).to.equal(2);
                    minMaxStack.pop();
                    expect(minMaxStack.top.value).to.equal(1);
                });

                it('Should decrement the MinMaxStack\'s length by one each time a node is removed from the MinMaxStack', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.push(3);
                    expect(minMaxStack.length).to.equal(3);
                    minMaxStack.pop();
                    expect(minMaxStack.length).to.equal(2);
                    minMaxStack.pop();
                    expect(minMaxStack.length).to.equal(1);
                });

                it('Should return the node removed from the MinMaxStack', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.pop().value).to.equal(2);
                    expect(minMaxStack.pop().value).to.equal(1);
                });
            });

            describe('size', () => {
                it('Should return a size of 0 for a new MinMaxStack', () => {
                    expect(minMaxStack.size()).to.equal(0);
                });

                it('Should return a size of 2 after two nodes are added to the MinMaxStack', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.size()).to.equal(2);
                });

                it('Should return a size of 1 after two nodes are added and then one is removed', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.pop();
                    expect(minMaxStack.size()).to.equal(1);
                });

                it('Should return a size of 0 after more nodes were removed than were added', () => {
                    minMaxStack.push(1);
                    minMaxStack.pop();
                    minMaxStack.pop();
                    expect(minMaxStack.size()).to.equal(0);
                });
            });

            describe('min', () => {
                it('Should return null for an empty MinMaxStack', () => {
                    expect(minMaxStack.min()).to.equal(null);
                });

                it('Should still return null for an empty MinMaxStack even after several nodes have been pushed to and popped of the MinMaxStack', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.push(3);
                    minMaxStack.pop();
                    minMaxStack.pop();
                    minMaxStack.pop();
                    expect(minMaxStack.min()).to.equal(null);
                });

                it('Should return the only node in the MinMaxStack for MinMaxStacks of size 1', () => {
                    minMaxStack.push(1);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the smallest value for MinMaxStacks of size 2', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the smallest value for MinMaxStacks with many nodes added in ascending order', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.push(3);
                    minMaxStack.push(4);
                    minMaxStack.push(5);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the smallest value for MinMaxStacks with many nodes added in descending order', () => {
                    minMaxStack.push(5);
                    minMaxStack.push(4);
                    minMaxStack.push(3);
                    minMaxStack.push(2);
                    minMaxStack.push(1);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the smallest value for MinMaxStacks with many nodes added in an unsorted order', () => {
                    minMaxStack.push(3);
                    minMaxStack.push(4);
                    minMaxStack.push(1);
                    minMaxStack.push(5);
                    minMaxStack.push(2);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the smallest value for MinMaxStacks with many nodes added in an unsorted order', () => {
                    minMaxStack.push(3);
                    minMaxStack.push(4);
                    minMaxStack.push(1);
                    minMaxStack.push(5);
                    minMaxStack.push(2);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the smallest value for MinMaxStacks with both positive and negative numbers', () => {
                    minMaxStack.push(-3);
                    minMaxStack.push(4);
                    minMaxStack.push(1);
                    minMaxStack.push(-5);
                    minMaxStack.push(2);
                    minMaxStack.push(0);
                    expect(minMaxStack.min().value).to.equal(-5);
                });

                it('Should still return the node with the smallest value after several nodes are popped off the MinMaxStack', () => {
                    minMaxStack.push(4);
                    minMaxStack.push(-3);
                    minMaxStack.push(1);
                    minMaxStack.push(-5);
                    minMaxStack.push(2);
                    minMaxStack.push(0);
                    minMaxStack.pop();
                    minMaxStack.pop();
                    minMaxStack.pop();
                    expect(minMaxStack.min().value).to.equal(-3);
                });

                it('Should still return the node with the smallest value even after several nodes are pushed and popped off the MinMaxStack back and forth', () => {
                    minMaxStack.push(4);
                    minMaxStack.push(-3);
                    minMaxStack.push(1);
                    minMaxStack.pop();
                    minMaxStack.push(-5);
                    minMaxStack.pop();
                    minMaxStack.push(2);
                    minMaxStack.push(0);
                    minMaxStack.pop();
                    expect(minMaxStack.min().value).to.equal(-3);
                });
            });

            describe('max', () => {
                it('Should return null for an empty MinMaxStack', () => {
                    expect(minMaxStack.max()).to.equal(null);
                });

                it('Should still return null for an empty MinMaxStack even after several nodes have been pushed to and popped of the MinMaxStack', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.push(3);
                    minMaxStack.pop();
                    minMaxStack.pop();
                    minMaxStack.pop();
                    expect(minMaxStack.max()).to.equal(null);
                });

                it('Should return the only node in the MinMaxStack for MinMaxStacks of size 1', () => {
                    minMaxStack.push(1);
                    expect(minMaxStack.max().value).to.equal(1);
                });

                it('Should return the node with the largest value for MinMaxStacks of size 2', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    expect(minMaxStack.min().value).to.equal(1);
                });

                it('Should return the node with the largest value for MinMaxStacks with many nodes added in ascending order', () => {
                    minMaxStack.push(1);
                    minMaxStack.push(2);
                    minMaxStack.push(3);
                    minMaxStack.push(4);
                    minMaxStack.push(5);
                    expect(minMaxStack.max().value).to.equal(5);
                });

                it('Should return the node with the largest value for MinMaxStacks with many nodes added in descending order', () => {
                    minMaxStack.push(5);
                    minMaxStack.push(4);
                    minMaxStack.push(3);
                    minMaxStack.push(2);
                    minMaxStack.push(1);
                    expect(minMaxStack.max().value).to.equal(5);
                });

                it('Should return the node with the largest value for MinMaxStacks with many nodes added in an unsorted order', () => {
                    minMaxStack.push(3);
                    minMaxStack.push(4);
                    minMaxStack.push(1);
                    minMaxStack.push(5);
                    minMaxStack.push(2);
                    expect(minMaxStack.max().value).to.equal(5);
                });
                it('Should return the node with the largest value for MinMaxStacks with many nodes added in an unsorted order', () => {
                    minMaxStack.push(3);
                    minMaxStack.push(4);
                    minMaxStack.push(1);
                    minMaxStack.push(5);
                    minMaxStack.push(2);
                    expect(minMaxStack.max().value).to.equal(5);
                });

                it('Should return the node with the largest value for MinMaxStacks with both positive and negative numbers', () => {
                    minMaxStack.push(-3);
                    minMaxStack.push(4);
                    minMaxStack.push(1);
                    minMaxStack.push(-5);
                    minMaxStack.push(2);
                    minMaxStack.push(0);
                    expect(minMaxStack.max().value).to.equal(4);
                });

                it('Should still return the node with the largest value after several nodes are popped off the MinMaxStack', () => {
                    minMaxStack.push(4);
                    minMaxStack.push(-3);
                    minMaxStack.push(1);
                    minMaxStack.push(-5);
                    minMaxStack.push(2);
                    minMaxStack.push(0);
                    minMaxStack.pop();
                    minMaxStack.pop();
                    minMaxStack.pop();
                    expect(minMaxStack.max().value).to.equal(4);
                });

                it('Should still return the node with the largest value even after several nodes are pushed and popped off the MinMaxStack back and forth', () => {
                    minMaxStack.push(4);
                    minMaxStack.push(-3);
                    minMaxStack.push(1);
                    minMaxStack.pop();
                    minMaxStack.push(-5);
                    minMaxStack.pop();
                    minMaxStack.push(2);
                    minMaxStack.push(0);
                    minMaxStack.pop();
                    expect(minMaxStack.max().value).to.equal(4);
                });
            });
        });
    });
});
