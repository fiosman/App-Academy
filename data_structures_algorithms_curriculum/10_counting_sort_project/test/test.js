const { expect } = require('chai');
const { countingSort } = require('../lib/counting_sort');
describe('countingSort', () => {
    let input;
    let expected;

    it('Should exist', () => {
        expect(countingSort).to.exist;
    });

    it('Should be a function', () => {
        expect(countingSort).to.be.a('function');
    });

    it('Should return an empty array for input arrays of length 0', () => {
        input = [];
        expect(countingSort(input, null)).to.eql([]);
    });

    it('Should return the input array for input arrays of length 1', () => {
        input = [1];
        expect(countingSort(input, 1)).to.eql([1]);
    });

    it('Should sort a small array of integers numerically in ascending order', () => {
        input = [4, 9, 0, 23, 15, 100, 66, 41, 5, 10];
        expected = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expect(countingSort(input, 100)).to.eql(expected);
    });

    it('Should sort a large array of randomly generated integers numerically in ascending order', () => {
        const max = 1000;     // Max integer
        const length = 1000     // Length of input array
        let number;             // Each individual integer
        let result;             // Result after sorting

        for (let i = 0; i < length; i++) {
            input.push(Math.floor(Math.random() * max));
        }

        result = countingSort(input, 1000);
        expected = input.sort((a, b) => a - b);

        for (let i = 0; i < length; i++) {
            expect(result[i]).to.equal(expected[i]);
        }
    });

    it('Should handle pre-sorted arrays', () => {
        input = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expected = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expect(countingSort(input, 100)).to.eql(expected);
    });

    it('Should sort reverse-sorted arrays', () => {
        input = [100, 66, 41, 23, 15, 10, 9, 5, 4, 0];
        expected = [0, 4, 5, 9, 10, 15, 23, 41, 66, 100];
        expect(countingSort(input, 100)).to.eql(expected);
    });
});
