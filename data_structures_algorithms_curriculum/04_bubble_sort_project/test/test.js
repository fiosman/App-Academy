const { expect } = require('chai');
const { bubbleSort, swap } = require('../lib/bubble_sort.js');

describe('swap()', () => {
    // it should accept an array and two indices as args

    it('should swap the elements at the given indices, mutating the original array', () => {
        let array = ['a', 'b', 'c'];
        swap(array, 0, 2);
        expect(array).to.eql(['c', 'b', 'a']);
    });

    it('should return the original array', () => {
        let array = ['a', 'b', 'c'];
        expect(swap(array, 1, 0)).to.equal(array);
    });
});

describe('bubbleSort()', () => {
    // it should accept an array of numbers as an arg

    it('should sort the elements of the array in increasing order, in-place', () => {
        let array = [2, -1, 4, 3, 7, 3];
        bubbleSort(array);
        expect(array).to.eql([-1, 2, 3, 3, 4, 7]);
    });
});