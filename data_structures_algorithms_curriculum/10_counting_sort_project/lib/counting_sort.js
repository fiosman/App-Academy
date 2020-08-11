function countingSort(arr, max) {
  let countersArr = new Array(max + 1).fill(0); //initialize new array of size k + 1 (because arrays are zero indexed)
  let sortedArr = []; //this is the output array that we will fill with sorted items

  //Populate countersArr with frequency of each number in the input array.
  //Each number in the input arr is rep'd by countersArr idx (i.e. How many times does 2 occur? We can access that by countersArr[2]);
  for (let i = 0; i < arr.length; i++) {
    countersArr[arr[i]] += 1;
  }

  //Here we update the countersArr with the positions of each element in the output array.
  for (let i = 1; i <= max; i++) {
    countersArr[i] = countersArr[i] + countersArr[i - 1];
  }

  //Store the values from the input array at appropriate position, which we derived from above.
  for (let i = arr.length - 1; i >= 0; i--) {
    countersArr[arr[i]] -= 1;
    sortedArr[countersArr[arr[i]]] = arr[i];
  }

  return sortedArr;
}

module.exports = {
  countingSort,
};

console.log(countingSort([1, 3, 2, 9, 4, 0, 8, 3, 1], 9));
