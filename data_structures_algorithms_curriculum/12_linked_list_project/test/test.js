const { Node, LinkedList } = require('../lib/linked_list.js');
const { expect } = require('chai');

describe('LinkedList', () => {
    let node;
    let linkedList;

    beforeEach(() => {
        linkedList = new LinkedList();
    });

    describe('Node Constructor', () => {
        it('Should exist', () => {
            expect(Node).to.exist;
        });

        it('Should be a function (ES6 classes are "special functions")', () => {
            expect(Node).to.be.a('function');
        });

        it('Should have "value" and "next" properties', () => {
            // it('Should have value, next, and prev properties', () => {  // Doubly Linked Lists Only!
            node = new Node('A');
            expect(node).to.have.property('value');
            expect(node).to.have.property('next');
            // expect(node).to.have.property('prev');  // Doubly Linked Lists Only!
        });
    });

    describe('LinkedList Constructor', () => {
        it('Should exist', () => {
            expect(LinkedList).to.exist;
        });

        it('Should be a function (ES6 classes are "special functions")', () => {
            expect(LinkedList).to.be.a('function');
        });

        it('Should have head, tail, and length properties', () => {
            expect(linkedList).to.have.property('head');
            expect(linkedList).to.have.property('tail');
            expect(linkedList).to.have.property('length');
        });

        it('Should always keep track of the length of the list', () => {
            expect(linkedList.length).to.equal(0);
            linkedList.addToTail('C');
            expect(linkedList.length).to.equal(1);
            linkedList.addToHead('A');
            expect(linkedList.length).to.equal(2);
            linkedList.insert(1, 'B');
            expect(linkedList.length).to.equal(3);
            linkedList.remove(1);
            expect(linkedList.length).to.equal(2);
            linkedList.removeTail();
            expect(linkedList.length).to.equal(1);
            linkedList.removeHead();
            expect(linkedList.length).to.equal(0);
        });
    });

    describe('LinkedList Methods', () => {
        it('Should have methods named "addToTail", "removeTail", "addToHead", "removeHead", "contains", "get", "set", "insert", "remove", and "size"', () => {
            expect(linkedList.addToTail).to.be.a('function');
            expect(linkedList.removeTail).to.be.a('function');
            expect(linkedList.addToHead).to.be.a('function');
            expect(linkedList.removeHead).to.be.a('function');
            expect(linkedList.contains).to.be.a('function');
            expect(linkedList.get).to.be.a('function');
            expect(linkedList.set).to.be.a('function');
            expect(linkedList.insert).to.be.a('function');
            expect(linkedList.remove).to.be.a('function');
            expect(linkedList.size).to.be.a('function');
        });

        describe('addToTail', () => {
            it('Should reassign the tail pointer when new nodes are added to the tail', () => {
                linkedList.addToTail('A');
                expect(linkedList.tail.value).to.equal('A');
                linkedList.addToTail('B');
                expect(linkedList.tail.value).to.equal('B');
            });

            it('Should reassign both the head and tail pointers when a new node is added to the tail of an empty list', () => {
                linkedList.addToTail('A');
                expect(linkedList.head).to.eql({ value: 'A', next: null });
                expect(linkedList.tail).to.eql({ value: 'A', next: null });
            });

            it('Should update the length property after new nodes are added to the tail', () => {
                expect(linkedList.length).to.equal(0);
                linkedList.addToTail('A');
                expect(linkedList.length).to.equal(1);
                linkedList.addToTail('B');
                expect(linkedList.length).to.equal(2);
            });

            it('Should return the updated list after new nodes are added to the tail', () => {
                expect(linkedList.addToTail('A')).to.eql({
                    head: { value: 'A', next: null },
                    tail: { value: 'A', next: null },
                    length: 1
                });
                expect(linkedList.addToTail('B')).to.eql({
                    head: { value: 'A', next: { value: 'B', next: null } },
                    tail: { value: 'B', next: null },
                    length: 2
                });
            });
        });

        describe('removeTail', () => {
            it('Should return undefined if the list is empty', () => {
                expect(linkedList.removeTail()).to.equal(undefined);
            });

            it('Should remove tail node from the list when removeTail is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.tail.value).to.equal('B');
                linkedList.removeTail();
                expect(linkedList.tail.value).to.equal('A');
            });

            it('Should reassign the new tail\'s next pointer to null', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                expect(linkedList.head.next.next).to.eql({ value: 'C', next: null });
                linkedList.removeTail();
                expect(linkedList.head.next.next).to.eql(null);
            });

            it('Should update the length property after removing the tail node', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.length).to.equal(2);
                linkedList.removeTail();
                expect(linkedList.length).to.equal(1);
                linkedList.removeTail();
                expect(linkedList.length).to.equal(0);
            });

            it('Should reassign both the head and tail pointers to null when tail is removed from a list of only one node', () => {
                linkedList.addToTail('A');
                expect(linkedList.length).to.equal(1);
                linkedList.removeTail();
                expect(linkedList.head).to.equal(null);
                expect(linkedList.tail).to.equal(null);
            });

            it('Should return the removed tail node when removeTail is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.removeTail()).to.eql({ value: 'B', next: null });
            });

        });

        describe('addToHead', () => {
            it('Should reassign the head pointer when new nodes are added to the head', () => {
                expect(linkedList.head).to.equal(null);
                linkedList.addToHead('B');
                expect(linkedList.head).to.eql({ value: 'B', next: null });
                linkedList.addToHead('A');
                expect(linkedList.head).to.eql({ value: 'A', next: { value: 'B', next: null } });
            });

            it('Should reassign both the head and tail pointers when a new node is added to the head of an empty list', () => {
                linkedList.addToHead('A');
                expect(linkedList.head).to.eql({ value: 'A', next: null });
                expect(linkedList.tail).to.eql({ value: 'A', next: null });
            });

            it('Should update the length property after new nodes are added to the head', () => {
                expect(linkedList.length).to.equal(0);
                linkedList.addToHead('A');
                expect(linkedList.length).to.equal(1);
                linkedList.addToHead('B');
                expect(linkedList.length).to.equal(2);
            });

            it('Should return the updated list after new nodes are added to the head', () => {
                expect(linkedList.addToHead('B')).to.eql({
                    head: { value: 'B', next: null },
                    tail: { value: 'B', next: null },
                    length: 1
                });
                expect(linkedList.addToHead('A')).to.eql({
                    head: { value: 'A', next: { value: 'B', next: null } },
                    tail: { value: 'B', next: null },
                    length: 2
                });
            });
        });

        describe('removeHead', () => {
            it('Should return undefined if the list is empty', () => {
                expect(linkedList.removeHead()).to.equal(undefined);
            });

            it('Should remove head node from the list when removeHead is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.head.value).to.equal('A');
                linkedList.removeHead();
                expect(linkedList.head.value).to.equal('B');
            });

            it('Should reassign the head pointer to the next node in the list', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.head.value).to.equal('A');
                linkedList.removeHead();
                expect(linkedList.head.value).to.equal('B');
            });

            it('Should update the length property after removing the head node', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.length).to.equal(2);
                linkedList.removeHead();
                expect(linkedList.length).to.equal(1);
                linkedList.removeHead();
                expect(linkedList.length).to.equal(0);
            });

            it('Should reassign both the head and tail pointers to null when head is removed from a list of only one node', () => {
                linkedList.addToTail('A');
                expect(linkedList.length).to.equal(1);
                linkedList.removeHead();
                expect(linkedList.head).to.equal(null);
                expect(linkedList.tail).to.equal(null);
            });

            it('Should return the removed head node when removeHead is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.removeHead()).to.eql({ value: 'A', next: { value: 'B', next: null } });
            });
        });

        describe('contains', () => {
            it('Should contain a value that was added', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.contains('A')).to.equal(true);
                expect(linkedList.contains('B')).to.equal(true);
                expect(linkedList.contains('C')).to.equal(false);
            });

            it('Should not contain a value that was removed', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.removeHead();
                expect(linkedList.contains('A')).to.equal(false);
            });
        });

        describe('get', () => {
            it('Should return null if index is out of bounds', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.get(7)).to.equal(null);
            });

            it('Should return node at index specified when get is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                expect(linkedList.get(1)).to.eql({ value: 'B', next: { value: 'C', next: null } });
            });
        });

        describe('set', () => {
            it('Should return true if node\'s value at index is updated', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('D');
                expect(linkedList.get(1)).to.eql({ value: 'B', next: { value: 'D', next: null } });
                expect(linkedList.set(2, 'C')).to.equal(true);
                expect(linkedList.get(1)).to.eql({ value: 'B', next: { value: 'C', next: null } });
            });

            it('Should return false if node is not found at provided index', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.set(2, 'C')).to.equal(false);
            });
        });

        describe('insert', () => {
            it('Should return false if index is out of bounds', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                expect(linkedList.insert(3, 'D')).to.equal(false);
            });

            it('Should return true if node is successfully inserted at index', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('D');
                expect(linkedList.get(1)).to.eql({ value: 'B', next: { value: 'D', next: null } });
                expect(linkedList.insert(2, 'C')).to.equal(true);
                expect(linkedList.get(1)).to.eql({ value: 'B', next: { value: 'C', next: { value: 'D', next: null } } });
            });

            it('Should update the length property when a node is inserted', () => {
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                linkedList.addToTail('E');
                expect(linkedList.length).to.equal(3);
                linkedList.insert(2, 'D');
                expect(linkedList.length).to.equal(4);
                linkedList.insert(0, 'A');
                expect(linkedList.length).to.equal(5);
                linkedList.insert(4, 'F');
                expect(linkedList.length).to.equal(6);
            });
        });

        describe('remove', () => {
            it('Should return undefined if index is out of bounds', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                expect(linkedList.remove(3)).to.equal(undefined);
            });

            it('Should remove node at index from the list when remove is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                expect(linkedList.get(0)).to.eql({ value: 'A', next: { value: 'B', next: { value: 'C', next: null } } });
                linkedList.remove(1);
                expect(linkedList.get(0)).to.eql({ value: 'A', next: { value: 'C', next: null } });
            });

            it('Should return the removed node when remove is called', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                expect(linkedList.remove(1)).to.eql({ value: 'B', next: { value: 'C', next: null } });
            });

            it('Should update the length property when a node is removed', () => {
                linkedList.addToTail('A');
                linkedList.addToTail('B');
                linkedList.addToTail('C');
                linkedList.remove(1);
                expect(linkedList.length).to.equal(2);
                linkedList.remove(1);
                expect(linkedList.length).to.equal(1);
            });
        });

        describe('size', () => {
            it('Should return the length of the list', () => {
                expect(linkedList.size()).to.equal(0);
                linkedList.addToTail('A');
                expect(linkedList.size()).to.equal(1);
                linkedList.addToTail('B');
                expect(linkedList.size()).to.equal(2);
                linkedList.removeTail();
                expect(linkedList.size()).to.equal(1);
            });
        });
    });
});