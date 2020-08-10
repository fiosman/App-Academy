const { expect } = require('chai');
const { insertionSort } = require('../lib/insertion_sort.js');

describe('insertionSort()', () => {
    // it should accept an array of numbers as an arg

    it('should sort the elements of the array in increasing order, in-place', () => {
        let array = [2, -1, 4, 3, 7, 3];
        insertionSort(array);
        expect(array).to.eql([-1, 2, 3, 3, 4, 7]);
    });
});