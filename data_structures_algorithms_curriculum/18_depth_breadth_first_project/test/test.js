const { expect } = require('chai');
const { TreeNode } = require('../lib/tree_node');
const { depthFirstSearch } = require('../lib/depth_first_search');
const { breadthFirstArray } = require('../lib/breadth_first_array');
const { treeSum } = require('../lib/tree_sum');
const { treeHeight } = require('../lib/tree_height');


describe('depthFirstSearch()', () => {
    // it should accept a tree and a targetVal as args

    it('should return the node of the tree that contains the targetVal', () => {
        let a = new TreeNode('a');
        let b = new TreeNode('b');
        let c = new TreeNode('c');
        let d = new TreeNode('d');
        let e = new TreeNode('e');
        let f = new TreeNode('f');
        a.left = b;
        a.right = c;
        b.left = d;
        b.right = e;
        c.right = f;
    
        expect(depthFirstSearch(a, 'e')).to.equal(e);
    });

    context('when multiple nodes of the tree contain the targetVal', () => {
        it('should return the first node according to Depth-First order (from left to right) that contains the targetVal', () => {
            let root = new TreeNode('a');
            let node1 = new TreeNode('b');
            let node2 = new TreeNode('x');
            let node3 = new TreeNode('x');
            root.left = node1;
            root.right = node3;
            node1.left = node2;

            expect(depthFirstSearch(root, 'x')).to.equal(node2);
        });
    })

    it('should return null if the targetVal is not in the tree', () => {
        let a = new TreeNode('a');
        let b = new TreeNode('b');
        let c = new TreeNode('c');
        let d = new TreeNode('d');
        let e = new TreeNode('e');
        let f = new TreeNode('f');
        a.left = b;
        a.right = c;
        b.left = d;
        b.right = e;
        c.right = f;
    
        expect(depthFirstSearch(a, 'g')).to.equal(null);
    });
});


describe('breadthFirstArray()', () => {
    // it should accept a tree as an arg

    it('should return an array containing tree\'s nodes\' values in Breadth-First order (from left to right)', () => {
        let a = new TreeNode('a');
        let b = new TreeNode('b');
        let c = new TreeNode('c');
        let d = new TreeNode('d');
        let e = new TreeNode('e');
        let f = new TreeNode('f');
        a.left = b;
        a.right = c;
        b.left = d;
        b.right = e;
        c.right = f;

        expect(breadthFirstArray(a)).to.eql(['a', 'b', 'c', 'd', 'e', 'f']);
    });
});


describe('treeSum()', () => {
    // it should accept a tree as an arg

    it('should return the sum of all node values in the tree', () => {
        let a = new TreeNode(10);
        let b = new TreeNode(-4);
        let c = new TreeNode(3);
        let d = new TreeNode(6);
        let e = new TreeNode(2);
        let f = new TreeNode(2);
        a.left = b;
        a.right = c;
        b.left = d;
        b.right = e;
        c.right = f;

        expect(treeSum(a)).to.equal(19);
        expect(treeSum(d)).to.equal(6);
    });

    it ('should return 0 if the tree is empty', () => {
        expect(treeSum(null)).to.equal(0);
    });
});


describe('treeHeight()', () => {
    // it should accept a tree as an arg

    it('should return the maximum number of edges between the root and any leaf', () => {
        let a = new TreeNode('a');
        let b = new TreeNode('b');
        let c = new TreeNode('c');
        let d = new TreeNode('d');
        let e = new TreeNode('e');
        a.left = b;
        a.right = c;
        b.left = d;
        b.right = e;
        expect(treeHeight(a)).to.equal(2);

        let w = new TreeNode('w');
        let x = new TreeNode('x');
        let y = new TreeNode('y');
        let z = new TreeNode('z');
        w.left = x;
        x.left = y;
        y.left = z;
        expect(treeHeight(w)).to.equal(3);
    });

    it('should return -1 if the tree is empty', () => {
        expect(treeHeight(null)).to.equal(-1);
    });

    it('should return 0 if the tree only contains a root', () => {
        let a = new TreeNode('a');
        expect(treeHeight(a)).to.equal(0);
    });
});