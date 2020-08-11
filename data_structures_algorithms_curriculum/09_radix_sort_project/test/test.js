const { expect } = require('chai');
const { radixSort } = require('../lib/radix_sort');

describe('radixSort', () => {
    let input;
    let expected;

    it('Should exist', () => {
        expect(radixSort).to.exist;
    });

    it('Should be a function', () => {
        expect(radixSort).to.be.a('function');
    });

    it('Should have exactly one input', () => {
        expect(radixSort.length).to.equal(1);
    });

    it('Should return null if input is not an array', () => {
        input = { 'Not': 'an array.' };
        expect(radixSort(input)).to.equal(null);
    });

    it('Should return an array if an array is provided as input', () => {
        input = [1, 3, 2];
        expect(radixSort(input)).to.be.an('array');
    });

    it('Should return an empty array for input arrays of length 0', () => {
        input = [];
        expect(radixSort(input)).to.eql([]);
    });

    it('Should return the input array for input arrays of length 1', () => {
        input = [1];
        expect(radixSort(input)).to.eql([1]);
    });

    it('Should create a new result array, and should NOT mutate the original array, ', () => {
        input = [1, 3, 2];
        expect(radixSort(input)).not.to.equal(input);
    });

    it('Should sort a small array of integers numerically in ascending order', () => {
        input = [4, 9, 0, 23, 15, 100, 66, 41, 5, 10];
        expected = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expect(radixSort(input)).to.eql(expected);
    });

    it('Should sort a large array of randomly generated integers numerically in ascending order', () => {
        const max = 999999999;  // Max integer
        const length = 1000     // Length of input array
        let number;             // Each individual integer
        let result;             // Result after sorting

        for (let i = 0; i < length; i++) {
            input.push(Math.floor(Math.random() * max));
        }

        result = radixSort(input);
        expected = input.sort((a, b) => a - b);

        for (let i = 0; i < length; i++) {
            expect(result[i]).to.equal(expected[i]);
        }
    });

    it('Should handle pre-sorted arrays', () => {
        input = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expected = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expect(radixSort(input)).to.eql(expected);
    });

    it('Should sort reverse-sorted arrays', () => {
        input = [100, 66, 41, 23, 15, 10, 9, 5, 4, 0];
        expected = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expect(radixSort(input)).to.eql(expected);
    });
});
