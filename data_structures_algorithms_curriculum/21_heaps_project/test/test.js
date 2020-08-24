const chai = require('chai');
chai.use(require('chai-spies'));
const { expect, spy } = chai;

const { MaxHeap } = require('../lib/max_heap');
const { isMaxHeap } = require('../lib/is_heap'); 


describe('MaxHeap', () => {
    describe('constructor()', () => {
        it('should initialize an `array` property to an array containing null', () => {
            let heap = new MaxHeap();
            expect(heap.array).to.be.a('array');
            expect(heap.array).to.eql([null]);
        });
    });

    describe('#getParent(idx)', () => {
        it('should return the parent idx of the given idx according to heap array rules', () => {
            let heap = new MaxHeap();
            expect(heap.getParent(4)).to.equal(2);
            expect(heap.getParent(6)).to.equal(3);
        });

        context('when the given idx is odd', () => {
            it('should still return the correct parent idx', () => {
                let heap = new MaxHeap();
                expect(heap.getParent(5)).to.equal(2);
                expect(heap.getParent(7)).to.equal(3);
            });
        });
    });

    describe('#getLeftChild(idx)', () => {
        it('should return the left child idx of the given idx according to heap array rules', () => {
            let heap = new MaxHeap();
            expect(heap.getLeftChild(7)).to.equal(14);
            expect(heap.getLeftChild(4)).to.equal(8);
        });
    });

    describe('#getRightChild(idx)', () => {
        it('should return the right child idx of the given idx according to heap array rules', () => {
            let heap = new MaxHeap();
            expect(heap.getRightChild(7)).to.equal(15);
            expect(heap.getRightChild(4)).to.equal(9);
        });
    });

    describe('#siftUp(idx)', () => {
        it('should continually sift up the element at given index until max heap property is restored', () => {
            let heap1 = new MaxHeap();
            heap1.array = [null, 100, 50, 27, 60];
            heap1.siftUp(4);
            expect(heap1.array).to.eql([null, 100, 60, 27, 50]);

            let heap2 = new MaxHeap();
            heap2.array = [null, 100, 50, 27, 101];
            heap2.siftUp(4);
            expect(heap2.array).to.eql([null, 101, 100, 27, 50]);
        });
    });

    describe('#insert(val)', () => {
        it('should insert the given value into the heap', () => {
            let heap = new MaxHeap();
            heap.insert(42);
            heap.insert(32);
            heap.insert(24);
            expect(heap.array).to.eql([null, 42, 32, 24]);
        });

        context('when max heap property is broken', () => {
            it ('should restore max heap property', () => {
                let heap = new MaxHeap();
                heap.insert(42);
                heap.insert(32);
                heap.insert(24);
                heap.insert(100);
                expect(heap.array).to.eql([null, 100, 42, 24, 32]);
            });

            it('should call #siftUp', () => {
                let heap = new MaxHeap();
                spy.on(heap, 'siftUp');
                heap.insert(42);
                heap.insert(32);
                heap.insert(24);
                heap.insert(100);
                expect(heap.siftUp).to.have.been.called.at.least(1);
            });
        });
    });

    describe('#siftDown(idx)', () => {
        it('should continually sift down the element at given index until max heap property is restored', () => {
            let heap1 = new MaxHeap();
            heap1.array = [null, 27, 30, 40, 20, 25, 16];
            heap1.siftDown(1);
            expect(heap1.array).to.eql([null, 40, 30, 27, 20, 25, 16]);

            let heap2 = new MaxHeap();
            heap2.array = [null, 5, 30, 40, 20, 25, 16];
            heap2.siftDown(1);
            expect(heap2.array).to.eql([null, 40, 30, 16, 20, 25, 5]);
        });
    });

    describe('#deleteMax()', () => {
        it('should delete the maximum element from the heap', () => {
            let heap = new MaxHeap();
            heap.array = [null, 100, 50, 27, 32, 42, 24];
            heap.deleteMax();
            expect(heap.array.includes(100)).to.equal(false);
        });

        it('should return the maximum element', () => {
            let heap = new MaxHeap();
            heap.array = [null, 100, 50, 27, 32, 42, 24];
            expect(heap.deleteMax()).to.equal(100);
        });

        it('should restore max heap property', () => {
            let heap = new MaxHeap();
            heap.array = [null, 100, 50, 27, 32, 42, 24];
            heap.deleteMax();
            expect(heap.array).to.eql([null, 50, 42, 27, 32, 24]);
        });

        it('should call #siftDown', () => {
            let heap = new MaxHeap();
            spy.on(heap, 'siftDown');
            heap.array = [null, 100, 50, 27, 32, 42, 24];
            heap.deleteMax();
            expect(heap.siftDown).to.have.been.called.at.least(1);
        });

        context('when the heap contains a single element', () => {
            it ('should remove and return that element', () => {
                let heap = new MaxHeap();
                heap.array = [null, 42];
                expect(heap.deleteMax()).to.equal(42);
                expect(heap.array).to.eql([null]);
            });
        });

        context('when the heap contains no elements', () => {
            it ('should return null', () => {
                let heap = new MaxHeap();
                expect(heap.deleteMax()).to.equal(null);
                expect(heap.deleteMax()).to.equal(null);
                expect(heap.array).to.eql([null]);
            });
        });
    });
});

describe('isMaxHeap(array)', () => {
    context('when the given array has max heap property', () => {
        it('should return true', () => {
            expect(isMaxHeap([null, 50, 42, 27, 32, 24])).to.equal(true);
            expect(isMaxHeap([null, 11, 10])).to.equal(true);
            expect(isMaxHeap([null, 11, 5, 10])).to.equal(true);
            expect(isMaxHeap([null])).to.equal(true);
        });
    });

    context('when the given array does not have max heap property' , () => {
        it('should return false', () => {
            expect(isMaxHeap([null, 10, 5, 7, 2, 6])).to.equal(false);
            expect(isMaxHeap([null, 0, 5, 7])).to.equal(false);
        });
    });
});

describe('Leet Code #215', () => {
    it ('https://leetcode.com/problems/kth-largest-element-in-an-array/')
});