// View the full problem and run the test cases at:
//  https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

const { TreeNode } = require("./bst");

function sortedArrayToBST(nums) {
  if (!nums.length) return null;

  let midIdx = Math.floor(nums.length / 2);
  let root = new TreeNode(nums[midIdx]);
  root.left = sortedArrayToBST(nums.slice(0, midIdx));
  root.right = sortedArrayToBST(nums.slice(midIdx + 1));

  return root;
}
