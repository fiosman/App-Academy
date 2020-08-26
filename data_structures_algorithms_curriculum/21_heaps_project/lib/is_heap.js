// you may assume that the array will always have a null element at the 0-th index
function isMaxHeap(array, idx = 1) {
  for (let rootIdx = idx; rootIdx < array.length; rootIdx++) {
    if (rootIdx * 2 < array.length) {
      if (array[rootIdx] < array[rootIdx * 2]) {
        return false;
      }
    }
    if (rootIdx * 2 + 1 < array.length) {
      if (array[rootIdx] < array[rootIdx * 2 + 1]) {
        return false;
      }
    }
  }

  return true;
}

module.exports = {
  isMaxHeap,
};

// console.log(isMaxHeap([null, 50, 42, 27, 32, 24]));
// console.log(isMaxHeap([null, 11, 10]));
// console.log(isMaxHeap([null, 11, 5, 10]));
// console.log(isMaxHeap([null]));
// console.log(isMaxHeap([null, 10, 5, 7, 2, 6]));
// console.log(isMaxHeap([null, 0, 5, 7]));
