function treeHeight(root) {
  let stack = [root];
  if (!root) return -1;

  let maxHeight = 0;
  while (stack.length) {
    let node = stack.pop();

    if (node.left || node.right) {
      maxHeight++;
    }

    if (node.right) stack.push(node.right);
    if (node.left) stack.push(node.left);
  }

  return maxHeight;
}

module.exports = {
  treeHeight,
};
