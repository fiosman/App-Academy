const { expect } = require('chai');
const { selectionSort, swap } = require('../lib/selection_sort.js');

describe('swap()', () => {
    // it should accept an array and two indices as args

    it('should swap the elements at the given indices, mutating the original array', () => {
        let array1 = ['a', 'b', 'c'];
        swap(array1, 0, 2);
        expect(array1).to.eql(['c', 'b', 'a']);

        let array2 = ['a', 'b', 'c'];
        swap(array2, 1, 0);
        expect(array2).to.eql(['b', 'a', 'c']);
    });
});

describe('selectionSort()', () => {
    // it should accept an array of numbers as an arg

    it('should sort the elements of the array in increasing order, in-place', () => {
        let array = [2, -1, 4, 3, 7, 3];
        selectionSort(array);
        expect(array).to.eql([-1, 2, 3, 3, 4, 7]);
    });
});