const { expect } = require('chai');
const { quickSort } = require('../lib/quick_sort.js');


describe('quickSort()', () => {
    // it should accept an array of numbers as an arg
    context('when the input array contains 0 or 1 elements', () => {
        it('should return the array', () => {
            expect(quickSort([])).to.eql([]);
            expect(quickSort([2])).to.eql([2]);
        });
    });

    context('when the input array contains more than 1 element', () => {
        it('should return an array containing the elements in increasing order', () => {
            expect(quickSort([2, -1, 4, 3, 7, 3])).to.eql([-1, 2, 3, 3, 4, 7]);
        });
    });
});
