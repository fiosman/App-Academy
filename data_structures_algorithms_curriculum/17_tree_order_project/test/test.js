const { expect } = require('chai');
const { TreeNode } = require('../lib/tree_node.js');
const { inOrderArray, postOrderArray } = require('../lib/tree_order.js');
const { buildTree } = require('../lib/leet_code_105.js');


describe('TreeNode', () => {
    describe('#constructor()', () => {
        it('should set the `val` property to the given arg', () => {
            let a = new TreeNode('a');
            expect(a.val).to.equal('a');

            let b = new TreeNode('b');
            expect(b.val).to.equal('b');
        });

        it('should initialize `left` and `right` properties to null', () => {
            let a = new TreeNode('a');
            expect(a.left).to.equal(null);
            expect(a.right).to.equal(null);            
        });
    });
});

describe('TreeOrder', () => {
    let root;

    beforeEach(() => {
        root = new TreeNode('a');
        let b = new TreeNode('b');
        let c = new TreeNode('c');
        let d = new TreeNode('d');
        let e = new TreeNode('e');
        let f = new TreeNode('f');

        root.left = b;
        root.right = c;
        b.left = d;
        b.right = e;
        c.right = f;
    });


    describe('inOrderArray()', () => {
        context('when given an empty tree', () => {
            it('should return an empty array', () => {
                expect(inOrderArray(null)).to.eql([]);
            });
        });

        it('should return an array containing values of the binary tree following In-Order', () => {
            expect(inOrderArray(root)).to.eql(['d', 'b', 'e', 'a', 'c', 'f']);
        });
    });

    describe('postOrderArray()', () => {
        context('when given an empty tree', () => {
            it('should return an empty array', () => {
                expect(postOrderArray(null)).to.eql([]);
            });
        });

        it('should return an array containing values of the binary tree following Post-Order', () => {
            expect(postOrderArray(root)).to.eql(['d', 'e', 'b', 'f', 'c', 'a']);
        });
    });
});

describe('Leet Code #105', () => {
    it('https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/');
});