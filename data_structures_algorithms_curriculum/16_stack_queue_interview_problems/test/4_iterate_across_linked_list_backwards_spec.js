const { iterateAcrossLinkedListBackwards } = require('../lib/4_iterate_across_linked_list_backwards.js');
const { expect } = require('chai');

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

describe('Problem 4: iterateAcrossLinkedListBackwards', () => {
    let linkedList;

    beforeEach(() => {
        linkedList = new LinkedList();
    });

    it('Should exist', () => {
        expect(iterateAcrossLinkedListBackwards).to.exist;
    });

    it('Should be a function', () => {
        expect(iterateAcrossLinkedListBackwards).to.be.a('function');
    });

    it('Should take at least one argument', () => {
        expect(iterateAcrossLinkedListBackwards.length).to.be.above(0);
    });

    it('Should return something', () => {
        linkedList.addToTail('First');

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.exist;
    });

    it('Should return an string', () => {
        linkedList.addToTail('First');

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.be.a('string');
    });

    it('Should return null for Linked Lists of size 0', () => {
        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.be.a('string').that.is.empty;
    });

    it('Should return a string of only one value with no arrows for Linked Lists of size 1', () => {
        linkedList.addToTail(1);

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.equal('1');
    });

    it('Should return a string representing the input Linked List\'s values backwards for Linked Lists of all numerical value', () => {
        linkedList.addToTail(1);
        linkedList.addToTail(2);
        linkedList.addToTail(3);
        linkedList.addToTail(4);
        linkedList.addToTail(5);

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.equal('5 -> 4 -> 3 -> 2 -> 1');
    });

    it('Should return a string representing the input Linked List\'s valuesbackwards for Linked Lists of all string values', () => {
        linkedList.addToTail('A');
        linkedList.addToTail('B');
        linkedList.addToTail('C');
        linkedList.addToTail('D');
        linkedList.addToTail('E');

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.equal('E -> D -> C -> B -> A');
    });

    it('Should return a string representing the input Linked List\'s valuesbackwards for Linked Lists of all boolean values', () => {
        linkedList.addToTail(true);
        linkedList.addToTail(false);
        linkedList.addToTail(false);
        linkedList.addToTail(true);
        linkedList.addToTail(false);

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.equal('false -> true -> false -> false -> true');
    });

    it('Should return a string representing the input Linked List\'s valuesbackwards for Linked Lists of mixed values', () => {
        linkedList.addToTail('1');
        linkedList.addToTail(null);
        linkedList.addToTail('A');
        linkedList.addToTail(false);
        linkedList.addToTail(undefined);

        result = iterateAcrossLinkedListBackwards(linkedList);
        expect(result).to.equal('undefined -> false -> A -> null -> 1');
    });
});