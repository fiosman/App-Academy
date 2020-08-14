const { reverseLinkedList } = require('../lib/1_reverse_linked_list.js');
const { stringify, linkedListIntersection } = require('../lib/2_linked_list_intersection.js');
const { LinkedList, hasCycle } = require('../lib/3_linked_list_cycles.js');
const { LRUCache, LRUCacheItem } = require('../lib/4_lru_cache.js');

const { expect } = require('chai');

describe('Problem 1: reverseLinkedList', () => {
    let linkedList;
    let result;
    let expected;

    beforeEach(() => {
        linkedList = new LinkedList();
        expected = new LinkedList();
    });

    it('Should exist', () => {
        expect(reverseLinkedList).to.exist;
    });

    it('Should be a function', () => {
        expect(reverseLinkedList).to.be.a('function');
    });

    it('Should return a LinkedList object', () => {
        linkedList.addToTail('First');
        result = reverseLinkedList(linkedList);

        expect(result).to.exist;
        expect(result).to.be.an.instanceof(Object);
    });

    it('Should return the same list if head.next is null', () => {
        linkedList.addToTail('First');
        result = reverseLinkedList(linkedList);

        expect(result).to.eql(linkedList);
    });

    it('Should reverse a very short list of only two nodes', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        result = reverseLinkedList(linkedList);

        expected.addToTail('Second');
        expected.addToTail('First');

        expect(result).to.eql(expected);
    });

    it('Should reverse a medium length list', () => {
        linkedList.addToTail('First');
        for (let i = 1; i <= 50; i++) linkedList.addToTail('First + ' + i);
        result = reverseLinkedList(linkedList);

        for (let j = 50; j > 0; j--) expected.addToTail('First + ' + j);
        expected.addToTail('First');

        expect(result).to.eql(expected);
    });

    it('Should reverse a very long list', () => {
        linkedList.addToTail('First');
        for (let i = 1; i <= 1000; i++) linkedList.addToTail('First + ' + i);
        result = reverseLinkedList(linkedList);

        for (let j = 1000; j > 0; j--) expected.addToTail('First + ' + j);
        expected.addToTail('First');

        expect(result).to.eql(expected);
    });
});

describe('Problem 2: linkedListIntersection', function () {
    let list1;
    let list2;
    let expected;
    let result;

    beforeEach(() => {
        list1 = new LinkedList();
        list2 = new LinkedList();
    });

    it('Should exist', function () {
        expect(linkedListIntersection).to.exist;
    });

    it('Should be a function', function () {
        expect(linkedListIntersection).to.be.a('function');
    });

    it('Should return the correct node in the case of two merged linked lists of the same size', function () {
        let nodeD;
        let nodeZ;

        list1.addToTail('A');
        list1.addToTail('B');
        list1.addToTail('C');
        list1.addToTail('D');
        list1.addToTail('E');
        list1.addToTail('F');

        list2.addToTail('X');
        list2.addToTail('Y');
        list2.addToTail('Z');

        nodeD = list1.get(3);
        nodeZ = list2.get(2);

        nodeZ.next = nodeD;

        expected = 'DEF';
        result = stringify(linkedListIntersection(list1, list2));

        expect(result).to.equal(expected);
    });


    it('Should return the correct node in the case of two merged linked lists of different sizes', function () {
        let nodeD;
        let nodeY;

        list1.addToTail('A');
        list1.addToTail('B');
        list1.addToTail('C');
        list1.addToTail('D');
        list1.addToTail('E');
        list1.addToTail('F');

        list2.addToTail('X');
        list2.addToTail('Y');

        nodeD = list1.get(3);
        nodeY = list2.get(1);

        nodeY.next = nodeD;

        expected = 'DEF';
        result = stringify(linkedListIntersection(list1, list2));

        expect(result).to.equal(expected);
    });

    it('Should return null if the two lists have no intersection', function () {
        list1.addToTail('A');
        list2.addToTail('X');

        expected = null;
        result = linkedListIntersection(list1, list2);

        expect(result).to.equal(expected);
    });
});

describe('Problem 3: hasCycle', () => {
    let linkedList;
    let result;

    beforeEach(() => {
        linkedList = new LinkedList();
    });

    it('Should exist', () => {
        expect(hasCycle).to.exist;
    });

    it('Should be a function', () => {
        expect(hasCycle).to.be.a('function');
    });

    it('Should take at least one argument', () => {
        expect(hasCycle.length).to.be.above(0);
    });

    it('Should return something', () => {
        linkedList.addToTail('First');

        result = hasCycle(linkedList);
        expect(result).to.exist;
    });

    it('Should return a boolean', () => {
        linkedList.addToTail('First');

        result = hasCycle(linkedList);
        expect(result).to.be.a('Boolean');
    });

    it('Should return false for a linked list with only 1 node that ponits to null', () => {
        linkedList.addToTail('First');

        result = hasCycle(linkedList);
        expect(result).to.be.false;
    });

    it('Should return true for a linked list with only 1 node that points to itself', () => {
        linkedList.addToTail('First');
        linkedList.tail.next = linkedList.head;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return false for a non-cyclical linked list of size 2', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');

        result = hasCycle(linkedList);
        expect(result).to.be.false;
    });

    it('Should return true for a cyclical linked list of size 2', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.tail.next = linkedList.head;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return false for a non-cyclical linked list of size 4', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.addToTail('Third');
        linkedList.addToTail('Fourth');

        result = hasCycle(linkedList);
        expect(result).to.be.false;
    });

    it('Should return true for a cyclical linked list of size 4 where the tail links to the head', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.addToTail('Third');
        linkedList.addToTail('Fourth');
        linkedList.tail.next = linkedList.head;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return true for a cyclical linked list of size 4 where the tail links to a node in the middle of the list', () => {
        let secondNode;

        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.addToTail('Third');
        linkedList.addToTail('Fourth');
        secondNode = linkedList.get(1);
        linkedList.tail.next = secondNode;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return false for a non-cyclical linked list of size 5', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.addToTail('Third');
        linkedList.addToTail('Fourth');
        linkedList.addToTail('Fifth');

        result = hasCycle(linkedList);
        expect(result).to.be.false;
    });

    it('Should return true for a cyclical linked list of size 5 where the tail links to the head', () => {
        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.addToTail('Third');
        linkedList.addToTail('Fourth');
        linkedList.addToTail('Fifth');
        linkedList.tail.next = linkedList.head;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return true for a cyclical linked list of size 5 where the tail links to a node in the middle of the list', () => {
        let secondNode;

        linkedList.addToTail('First');
        linkedList.addToTail('Second');
        linkedList.addToTail('Third');
        linkedList.addToTail('Fourth');
        linkedList.addToTail('Fifth');
        secondNode = linkedList.get(1);
        linkedList.tail.next = secondNode;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return false for a medium-sized non-cyclical linked list', () => {
        linkedList.addToTail('First');
        for (let i = 1; i < 101; i++) linkedList.addToTail('First + ' + i);

        result = hasCycle(linkedList);
        expect(result).to.be.false;
    });

    it('Should return true for a medium-sized cyclical linked list where the tail links to the head', () => {
        linkedList.addToTail('First');
        for (let i = 1; i < 101; i++) linkedList.addToTail('First + ' + i);
        linkedList.tail.next = linkedList.head;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return true for a medium-sized cyclical linked list where the tail links to a node in the middle of the list', () => {
        let fiftiethNode;

        linkedList.addToTail('First');
        for (let i = 1; i < 101; i++) linkedList.addToTail('First + ' + i);
        fiftiethNode = linkedList.get(49);
        linkedList.tail.next = fiftiethNode;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return false for a large-sized non-cyclical linked list', () => {
        linkedList.addToTail('First');
        for (let i = 1; i < 1000000; i++) linkedList.addToTail('First + ' + i);

        result = hasCycle(linkedList);
        expect(result).to.be.false;
    });

    it('Should return true for a large-sized cyclical linked list where the tail links to the head', () => {
        linkedList.addToTail('First');
        for (let i = 1; i < 1000000; i++) linkedList.addToTail('First + ' + i);
        linkedList.tail.next = linkedList.head;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });

    it('Should return true for a large-sized cyclical linked list where the tail links to a node in the middle of the list', () => {
        let fiveHundredThousandthNode;

        linkedList.addToTail('First');
        for (let i = 1; i < 1000000; i++) linkedList.addToTail('First + ' + i);
        fiveHundredThousandthNode = linkedList.get(499999);
        linkedList.tail.next = fiveHundredThousandthNode;

        result = hasCycle(linkedList);
        expect(result).to.be.true;
    });
});

describe('Problem 4: LRUCache', () => {
    let lruCache;

    beforeEach(() => {
        lruCache = new LRUCache(10);
    });

    describe('LRUCacheItem', () => {
        it('Should exist', () => {
            expect(LRUCacheItem).to.exist;
        });

        it('Should be a function (ES6 classes are "special functions")', () => {
            expect(LRUCacheItem).to.be.a('function');
        });
    });

    describe('LRUCache', () => {
        it('Should exist', () => {
            expect(LRUCache).to.exist;
        });

        it('Should be a function (ES6 classes are "special functions")', () => {
            expect(LRUCache).to.be.a('function');
        });

        it('Should take at least one argument', () => {
            expect(LRUCache.length).to.be.above(0);
        });

        describe('When unpopulated', () => {
            it('Should be empty', () => {
                expect(lruCache.size()).to.equal(0);
            });
        });

        describe('When populated and under its limit', () => {
            it('Should contain all of the populated items', () => {
                for (let i = 0; i < 9; i++) lruCache.set(i, i);
                for (let j = 0; j < 9; j++) expect(lruCache.get(j)).to.equal(j);
            });
        });

        describe('When populated and over its limit', () => {
            it('Should contain exactly "limit" items', () => {
                for (let i = 0; i < 20; i++) lruCache.set(i, i);

                expect(lruCache.size()).to.equal(10);
            });

            it('Should only contain the most recently used items', () => {
                for (let i = 0; i < 15; i++) lruCache.set(i, i);
                for (let j = 0; j < 5; j++) expect(lruCache.get(j)).to.equal(null);
                for (let k = 5; k < 15; k++) expect(lruCache.get(k)).to.equal(k);
            });

            it('Should remove items in LRU order', () => {
                for (let i = 0; i < 8; i++) lruCache.set(i, i);
                lruCache.get(0);
                for (let j = 8; j < 14; j++) lruCache.set(j, j);

                expect(lruCache.get(0)).to.equal(0);
                expect(lruCache.get(1)).to.equal(null);
            });
        });
    });

    describe('LRUCache Methods', () => {
        it('Should have methods named "size", "get", and "set"', () => {
            expect(lruCache.size).to.be.a('function');
            expect(lruCache.get).to.be.a('function');
            expect(lruCache.set).to.be.a('function');
        });

        describe('size', () => {
            it('Should return the size of the LRUCache', () => {
                expect(lruCache.size()).to.equal(0);
                lruCache.set('a', 'A');
                expect(lruCache.size()).to.equal(1);
                lruCache.set('b', 'B');
                expect(lruCache.size()).to.equal(2);
                lruCache.set('c', 'C');
                expect(lruCache.size()).to.equal(3);
            });
        });

        describe('get', () => {
            it('Should return null if the LRUCache does not have an item corresponding to the key provided', () => {
                lruCache.set('a', 'A');
                lruCache.set('b', 'B');

                expect(lruCache.get('c')).to.equal(null);
            });

            it('Should return the value of an item in the LRUCache that corresopnds to the key provided', () => {
                lruCache.set('a', 'A');
                lruCache.set('b', 'B');

                expect(lruCache.get('a')).to.equal('A');
                expect(lruCache.get('b')).to.equal('B');
            });
        });

        describe('set', () => {
            it('Should create a new item and add it to the LRUCache if one doesn\'t exists with the key provided', () => {
                lruCache.set('a', 'A');
                lruCache.set('b', 'B');

                expect(lruCache.get('a')).to.equal('A');
                expect(lruCache.get('b')).to.equal('B');
            });

            it('Should update the item corresponding to the key provided if one already exists with that key', () => {
                lruCache.set('a', 'A');
                lruCache.set('b', 'B');
                lruCache.set('a', 'Not A');
                lruCache.set('b', 'Not B');

                expect(lruCache.get('a')).to.equal('Not A');
                expect(lruCache.get('b')).to.equal('Not B');
            });
        });
    });
});
