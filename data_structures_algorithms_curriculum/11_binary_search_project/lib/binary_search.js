function binarySearch(array, target) {
  if (array.length === 0) return false;

  let midIdx = Math.floor(array.length / 2);
  let leftHalf = array.slice(0, midIdx);
  let rightHalf = array.slice(midIdx + 1);

  if (target < array[midIdx]) {
    return binarySearch(leftHalf, target);
  } else if (target > array[midIdx]) {
    return binarySearch(rightHalf, target);
  } else {
    return true;
  }
}

function binarySearchIndex(array, target, lo = 0, hi = array.length - 1) {
  if (lo === hi) {
    return -1;
  }

  let midIdx = Math.floor((lo + hi) / 2);

  if (target < array[midIdx]) {
    return binarySearchIndex(array, target, lo, midIdx);
  } else if (target > array[midIdx]) {
    return binarySearchIndex(array, target, midIdx + 1, hi);
  } else {
    return midIdx;
  }
}

module.exports = {
  binarySearch,
  binarySearchIndex,
};
