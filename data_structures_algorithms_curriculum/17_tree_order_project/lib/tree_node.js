class TreeNode {
  constructor(val) {
    this.val = val;
    this.right = null;
    this.left = null;
  }
}

module.exports = {
  TreeNode,
};

function invertTree(root) {
  if (!root) {
    return null;
  }

  let temp = root.left;
  root.left = root.right;
  root.right = temp;

  invertTree(root.left);
  invertTree(root.right);

  return root;
}

let four = new TreeNode(4);
let two = new TreeNode(2);
let seven = new TreeNode(7);
let one = new TreeNode(1);
let three = new TreeNode(3);
let six = new TreeNode(6);
let nine = new TreeNode(9);

four.left = two;
four.right = seven;
two.left = one;
two.right = three;
seven.left = six;
seven.right = nine;

console.log(invertTree(four));
