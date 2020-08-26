//https://leetcode.com/problems/kth-largest-element-in-an-array/
import MaxHeap from "./max_heap";

function findKthLargest(nums, k) {
  let maxHeap = new MaxHeap();

  //heapify the given array;
  for (let i = 0; i < nums.length; i++) {
    maxHeap.insert(nums[i]);
  }

  let kthElement = 0;
  while (kthElement < k - 1) {
    maxHeap.deleteMax();
    kthElement++;
  }

  return maxHeap.array[1];
}
