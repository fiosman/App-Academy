const util = require('./util');
const chai = require('chai');
const { expect } = chai;

const { 
    lucasNumberMemo,
    minChange
} = require('../lib/problems');

describe('lucasNumberMemo(n)', () => {
    it('should calculate the n-th number of the lucas sequence', () => {
        util.catchStackOverflow(lucasNumberMemo, 10);

        expect(lucasNumberMemo(0)).to.equal(2);
        expect(lucasNumberMemo(1)).to.equal(1);
        expect(lucasNumberMemo(5)).to.equal(11);
        expect(lucasNumberMemo(9)).to.equal(76);
    });

    it('should use memoization', () => {
        util.catchStackOverflow(lucasNumberMemo, 10);

        let memo = { 'key': 'value' };
        expect(lucasNumberMemo('key', memo)).to.equal('value');
    });

    context('when the input is large', () => {
        it ('runtime should not grow exponentially', () => {
            util.catchStackOverflow(lucasNumberMemo, 10);
            
            expect(lucasNumberMemo(40)).to.equal(228826127);
            expect(lucasNumberMemo(41)).to.equal(370248451);
            expect(lucasNumberMemo(42)).to.equal(599074578);
        });
    });
});

describe('minChange(coins, amount)', () => {
    it('it should return the minimum number of coins needed to make the amount', () => {
        util.catchStackOverflow(minChange, [1, 2, 5], 11);

        expect(minChange([1, 2, 5], 11)).to.equal(3)
        expect(minChange([1, 4, 5], 8)).to.equal(2)
        expect(minChange([1, 5, 10, 25], 15)).to.equal(2)
        expect(minChange([1, 2, 5], 0)).to.equal(0)
        expect(minChange([83, 186, 408, 419], 6249)).to.equal(20)
    });

    context('when the input is large', () => {
        it('runtime should not grow exponentially', () => {
            util.catchStackOverflow(minChange, [1, 2, 5], 11);

            expect(minChange([1, 5, 10, 25], 100)).to.equal(4)
        });
    });
});

describe('Leet Code #518 - Coin Change 2', () => {
    it('https://leetcode.com/problems/coin-change-2/');
})