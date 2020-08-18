// View the full problem and run the test cases at:
//  https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

const { TreeNode } = require("./tree_node.js");

function buildTree(preorder, inorder) {
  if (preorder.length === 0 || inorder.length === 0) return null;

  let rootIndex = inorder.indexOf(preorder[0]);
  let rootNode = new TreeNode(preorder[0]);

  let leftInorder = inorder.slice(0, rootIndex);
  let rightInorder = inorder.slice(rootIndex + 1);

  let leftPreorder = preorder.slice(1, leftInorder.length + 1);
  let rightPreorder = preorder.slice(leftPreorder.length + 1);

  let leftTree = buildTree(leftPreorder, leftInorder);
  let rightTree = buildTree(rightPreorder, rightInorder);

  rootNode.right = rightTree;
  rootNode.left = leftTree;

  return rootNode;
}
