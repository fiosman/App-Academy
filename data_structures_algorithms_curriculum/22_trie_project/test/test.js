const chai = require('chai');
chai.use(require('chai-spies'));
const { expect, spy } = chai;

const { Node, Trie } = require('../lib/trie');


describe('Node', () => {
    describe('constructor()', () => {
        it('should initialize the `children` property to an empty object', () => {
            let node = new Node();
            expect(node.children).to.be.a('object');
            expect(node.children).to.be.empty;
        });

        it ('should initialize the `isTerminal` property to false', () => {
            let node = new Node();
            expect(node.isTerminal).to.equal(false);
        });
    });
});

describe('Trie', () => {
    describe('constructor()', () => {
        it('should initialize the `root` property to a node instance', () => {
            let trie = new Trie();
            expect(trie.root).to.be.an.instanceOf(Node);
        });
    });

    describe('#insertRecur(word)', () => {
        it('should be a recursive function', () => {
            let trie = new Trie();
            spy.on(trie, 'insertRecur');
            trie.insertRecur('ten');

            expect(trie.insertRecur).to.have.been.called.above(1);
        });

        it('should insert the given word into the trie', () => {
            let trie = new Trie();
            trie.insertRecur('ten');

            expect(trie.root.children).to.have.all.keys('t');
            expect(trie.root.children.t.children).to.have.all.keys('e');
            expect(trie.root.children.t.children.e.children).to.have.all.keys('n');
            expect(trie.root.children.t.children.e.children.n.children).to.be.empty;
        });

        it('should mark the last node of the inserted word as terminal', () => {
            let trie = new Trie();
            trie.insertRecur('ten');

            expect(trie.root.children.t.children.e.children.n.isTerminal).to.be.equal(true);
        });

        context('when the inserted words have common prefixes', () => {
            it('should share edges among those words', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');

                expect(trie.root.children).to.have.all.keys('t');
                expect(trie.root.children.t.children).to.have.all.keys('e');
                expect(trie.root.children.t.children.e.children).to.have.all.keys('a', 'n');
            });
        });

        context('when the inserted words do not have common prefixes', () => {
            it('should not share edges among those words', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('in');

                expect(trie.root.children).to.have.all.keys('t', 'i');
                expect(trie.root.children.i.children).to.have.all.keys('n');
                expect(trie.root.children.t.children).to.have.all.keys('e');
                expect(trie.root.children.t.children.e.children).to.have.all.keys('n');
            });
        });
    });

    describe('#insertIter(word)', () => {
        it('should not be recursive', () => {
            let trie = new Trie();
            spy.on(trie, 'insertIter');
            trie.insertIter('ten');

            expect(trie.insertIter).to.have.been.called.once;
        });

        it('should insert the given word into the trie', () => {
            let trie = new Trie();
            trie.insertIter('ten');

            expect(trie.root.children).to.have.all.keys('t');
            expect(trie.root.children.t.children).to.have.all.keys('e');
            expect(trie.root.children.t.children.e.children).to.have.all.keys('n');
            expect(trie.root.children.t.children.e.children.n.children).to.be.empty;
        });

        it('should mark the last node of the inserted word as terminal', () => {
            let trie = new Trie();
            trie.insertIter('ten');

            expect(trie.root.children.t.children.e.children.n.isTerminal).to.be.equal(true);
        });

        context('when the inserted words have common prefixes', () => {
            it('should share edges among those words', () => {
                let trie = new Trie();
                trie.insertIter('ten');
                trie.insertIter('tea');

                expect(trie.root.children).to.have.all.keys('t');
                expect(trie.root.children.t.children).to.have.all.keys('e');
                expect(trie.root.children.t.children.e.children).to.have.all.keys('a', 'n');
            });
        });

        context('when the inserted words do not have common prefixes', () => {
            it('should not share edges among those words', () => {
                let trie = new Trie();
                trie.insertIter('ten');
                trie.insertIter('in');

                expect(trie.root.children).to.have.all.keys('t', 'i');
                expect(trie.root.children.i.children).to.have.all.keys('n');
                expect(trie.root.children.t.children).to.have.all.keys('e');
                expect(trie.root.children.t.children.e.children).to.have.all.keys('n');
            });
        });
    });

    describe('#searchRecur(word)', () => {
        it('should be a recursive function', () => {
            let trie = new Trie();
            trie.insertRecur('ten');
            spy.on(trie, 'searchRecur');
            trie.searchRecur('ten');

            expect(trie.searchRecur).to.have.been.called.above(1);
        });

        context('when the given word is contained in the trie', () => {
            it('should return true', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');
                trie.insertRecur('in');
                trie.insertRecur('inn');

                expect(trie.searchRecur('ten')).to.equal(true);
                expect(trie.searchRecur('tea')).to.equal(true);
                expect(trie.searchRecur('in')).to.equal(true);
                expect(trie.searchRecur('inn')).to.equal(true);
            });
        });

        context('when the given word is not contained in the trie', () => {
            it('should return false', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');
                trie.insertRecur('in');
                trie.insertRecur('inn');

                expect(trie.searchRecur('hi')).to.equal(false);
                expect(trie.searchRecur('hello')).to.equal(false);
                expect(trie.searchRecur('te')).to.equal(false);
                expect(trie.searchRecur('tex')).to.equal(false);
            });
        });
    });

    describe('#searchIter(word)', () => {
        it('should not be a recursive function', () => {
            let trie = new Trie();
            trie.insertRecur('ten');
            spy.on(trie, 'searchIter');
            trie.searchIter('ten');

            expect(trie.searchIter).to.have.been.called.once;
        });

        context('when the given word is contained in the trie', () => {
            it('should return true', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');
                trie.insertRecur('in');
                trie.insertRecur('inn');

                expect(trie.searchIter('ten')).to.equal(true);
                expect(trie.searchIter('tea')).to.equal(true);
                expect(trie.searchIter('in')).to.equal(true);
                expect(trie.searchIter('inn')).to.equal(true);
            });
        });

        context('when the given word is not contained in the trie', () => {
            it('should return false', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');
                trie.insertRecur('in');
                trie.insertRecur('inn');

                expect(trie.searchIter('hi')).to.equal(false);
                expect(trie.searchIter('hello')).to.equal(false);
                expect(trie.searchIter('te')).to.equal(false);
                expect(trie.searchIter('tex')).to.equal(false);
            });
        });
    });

    describe('#wordsWithPrefix(prefix)', () => {
        context('when the prefix is the empty string', () => {
            it('should return an array of all recognized words', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');
                trie.insertRecur('taco');
                trie.insertRecur('tex');
                trie.insertRecur('in');
                trie.insertRecur('inn');
                trie.insertRecur('inside');
                trie.insertRecur('instructor');
                
                expect(trie.wordsWithPrefix('').sort()).to.eql(['in', 'inn', 'inside', 'instructor', 'taco', 'tea', 'ten', 'tex']);
            });
        });

        context('when the given prefix is nonempty', () => {
            it('should return an array containing all words recognized by the trie that have the prefix', () => {
                let trie = new Trie();
                trie.insertRecur('ten');
                trie.insertRecur('tea');
                trie.insertRecur('taco');
                trie.insertRecur('tex');
                trie.insertRecur('in');
                trie.insertRecur('inn');
                trie.insertRecur('inside');
                trie.insertRecur('instructor');
    
                expect(trie.wordsWithPrefix('t').sort()).to.eql(['taco', 'tea', 'ten', 'tex']);
                expect(trie.wordsWithPrefix('te').sort()).to.eql(['tea', 'ten', 'tex']);
                expect(trie.wordsWithPrefix('tex').sort()).to.eql(['tex']);
                expect(trie.wordsWithPrefix('in').sort()).to.eql(['in', 'inn', 'inside', 'instructor']);
                expect(trie.wordsWithPrefix('ins').sort()).to.eql(['inside', 'instructor']);
                expect(trie.wordsWithPrefix('inner').sort()).to.eql([]);
                expect(trie.wordsWithPrefix('zoo').sort()).to.eql([]);
            });
        });
    });
});

describe('Leet Code #208', () => {
    it('https://leetcode.com/problems/implement-trie-prefix-tree/');
});