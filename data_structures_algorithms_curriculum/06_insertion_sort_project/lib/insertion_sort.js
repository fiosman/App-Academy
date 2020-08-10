function insertionSort(arr) {
  for (let i = 1; i < arr.length; i++) {
    let currentEle = arr[i];
    let j = i - 1;

    while (j >= 0 && arr[j] > currentEle) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = currentEle;
  }

  return arr;
}

module.exports = {
  insertionSort,
};
