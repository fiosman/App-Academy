const chai = require('chai');
chai.use(require('chai-spies'));
const { expect, spy } = chai;

const { GraphNode } = require('../lib/graph_node');
const { breadthFirstSearch } = require('../lib/breadth_first_search');
const { maxValue } = require('../lib/max_value');
const { numRegions } = require('../lib/num_regions');

describe('GraphNode Algorithms', () => {
    describe('breadthFirstSearch(startingNode, targetVal)', () => {
        // it should accept a starting GraphNode and a targetVal as args

        context('when the targetVal is not contained in the full graph', () => {
            it('should return null', () => {
                let a = new GraphNode('a');
                let b = new GraphNode('b');
                let c = new GraphNode('c');
                a.neighbors = [b, c]
                expect(breadthFirstSearch(a, 'x')).to.equal(null);
            });
        });

        context('when the targetVal is contained in the full graph', () => {
            it('should return the GraphNode that has the targetVal', () => {
                let a = new GraphNode('a');
                let b = new GraphNode('b');
                let c = new GraphNode('c');
                a.neighbors = [b, c];
                expect(breadthFirstSearch(a, 'c')).to.equal(c);
                expect(breadthFirstSearch(a, 'a')).to.equal(a);
            });
        });

        context('when the graph contains duplicate instances of targetVal', () => {
            it('should return the first GraphNode that contains the targetVal according to left-to-right Breadth-First order', () => {
                let a = new GraphNode('a');
                let b = new GraphNode('b');
                let c1 = new GraphNode('c');
                let c2 = new GraphNode('c');
                a.neighbors = [b, c1];
                b.neighbors = [c2];
                expect(breadthFirstSearch(a, 'c')).to.equal(c1);

                let x = new GraphNode('x');
                let y1 = new GraphNode('y');
                let y2 = new GraphNode('y');
                x.neighbors = [y1, y2];
                expect(breadthFirstSearch(x, 'y')).to.equal(y1);
            });
        });

        context('when the graph has a cycle', () => {
            it('should not get trapped in an infinite loop', () => {
                let s = new GraphNode('s');
                let t = new GraphNode('t');
                s.neighbors = [t];
                t.neighbors = [s];
                expect(breadthFirstSearch(s, 'q')).to.equal(null);

                let u = new GraphNode('u');
                let v = new GraphNode('v');
                let w = new GraphNode('w');
                u.neighbors = [v];
                v.neighbors = [u, w];
                expect(breadthFirstSearch(u, 'w')).to.equal(w);
            });
        });
    });

    describe('maxValue(startingNode)', () => {
        // it should accept a starting GraphNode as an arg

        it('should return the largest value within the full graph', () => {
            let five = new GraphNode(5);
            let three = new GraphNode(3);
            let two = new GraphNode(2);
            let four = new GraphNode(4);
            let ten = new GraphNode(10);
            let seven = new GraphNode(7);
            let six = new GraphNode(6);
            five.neighbors = [three, two, four];
            two.neighbors = [seven, ten];
            four.neighbors = [six];
            expect(maxValue(five)).to.equal(10);

            let eight = new GraphNode(8);
            expect(maxValue(eight)).to.equal(8);
        });

        context('when the graph has a cycle', () => {
            it('should not get trapped in an infinite loop', () => {
                let seven = new GraphNode(7);
                let eight = new GraphNode(8);
                let nine = new GraphNode(9);
                seven.neighbors = [eight];
                eight.neighbors = [nine];
                nine.neighbors = [seven];
                expect(maxValue(seven)).to.equal(9);
            });
        });
    });

});

describe('Adjacency List Algorithms', () => {
    describe('numRegions(graph)', () => {
        // it should accept an adjacency list representing a graph

        it('should return the number of connected components that make up the full graph', () => {
            let graph1 = {
                'a': ['b'],
                'b': ['a'],
                'c': ['d'],
                'd': ['e', 'c'],
                'e': ['d'],
            };
            expect(numRegions(graph1)).to.equal(2);

            let graph2 = {
                'x': [],
                'y': [],
                'z': []
            };
            expect(numRegions(graph2)).to.equal(3);
        });

        context('when the graph has a cycle', () => {
            it('should not get trapped in an infinite loop', () => {
                let graph1 = {
                    'a': ['b'],
                    'b': ['a'],
                };
                expect(numRegions(graph1)).to.equal(1);

                let graph2 = {
                    'q': ['r'],
                    'r': ['q'],
                    's': ['t'],
                    't': ['s', 'u', 'v'],
                    'u': ['t', 'v'],
                    'v': ['u', 't'],
                    'w': []
                };
                expect(numRegions(graph2)).to.equal(3);
            });
        });
    });
});


describe('Leet Code #207', () => {
    it('https://leetcode.com/problems/course-schedule/');
});



