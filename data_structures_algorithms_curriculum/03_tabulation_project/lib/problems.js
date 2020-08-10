// Write a function, stepper(nums), that takes in an array of non negative numbers.
// Each element of the array represents the maximum number of steps you can take from that position in the array.
// The function should return a boolean indicating if it is possible to travel from the
// first position of the array to the last position.
//
// For Example:
//
// Given [3, 1, 0, 5, 10]
//      - We begin at first position, 3.
//      - Since the element is 3 we can take up to 3 steps from this position.
//      - This means we can step to the 1, 0, or 5
//      - Say we step to 1
//      - Since the element is 1, now the only option is to take 1 step to land on 0
//      - etc...
//
// Try to solve this in two ways, using tabulation and memoization.
//
// Examples:
//
// console.log(stepper([3, 1, 0, 5, 10]));           // => true, because we can step through elements 3 -> 5 -> 10
// console.log(stepper([3, 4, 1, 0, 10]));           // => true, because we can step through elements 3 -> 4 -> 10
// console.log(stepper([2, 3, 1, 1, 0, 4, 7, 8]))    // => false, there is no way to step to the end
function stepperTab(nums) {
  let dp = new Array(nums.length);
  dp[0] = true;

  for (let i = 0; i < dp.length; i++) {
    if (dp[i] === true) {
      let maxRange = nums[i];
      for (let j = 1; j <= maxRange; j++) {
        dp[i + j] = true;
      }
    } else {
      dp[i] = false;
    }
  }
  return dp[nums.length - 1];
}

function stepperMemo(nums, memo = {}) {
  let memoKey = String(nums);
  if (memoKey in memo) return memo[memoKey];
  if (nums.length === 1) return true;

  const maxRange = nums[0];

  for (let i = 1; i <= maxRange; i++) {
    if (stepperMemo(nums.slice(i), memo)) {
      memo[memoKey] = true;
      return memo[memoKey];
    }
  }
  memo[memoKey] = false;
  return memo[memoKey];
}

// Write a function, maxNonAdjacentSum(nums), that takes in an array of nonnegative numbers.
// The function should return the maximum sum of elements in the array we can get if we cannot take
// adjacent elements into the sum.
//
// Try to solve this in two ways, using tabulation and memoization.
//
// Examples:
//
// maxNonAdjacentSum([2, 7, 9, 3, 4])   // => 15, because 2 + 9 + 4
// maxNonAdjacentSum([4,2,1,6])         // => 10, because 4 + 6

//dp tabulation method
function maxNonAdjacentSum(nums) {
  let dp = new Array(nums.length);

  if (nums.length === 0) return 0;

  //these are our base cases; can't take the maxNonAdjacentSum of only 1 or 2 elements (can't add two elements together; illegal so take max).
  dp[0] = nums[0];
  dp[1] = Math.max(dp[0], nums[1]);

  //my code may not be very intuitive here due to lack of variables
  //however; basically we will be always checking if the current number in the given array is greater than the maxNonAdjacentSum we have so far
  //We perform this operation legally; we do not compare to dp[i-1] as that would violate our non-adjacent number rule. We compare to dp [i-2]
  //because that is the max non adjacent sum that is not adjacent to the current number we are iterating over.
  for (let i = 2; i < dp.length; i++) {
    dp[i] = Math.max(nums[i] + dp[i - 2], dp[i - 1]);
  }

  return dp[nums.length - 1];
}

// Write a function, minChange(coins, amount), that accepts an array of coin values
// and a target amount as arguments. The method should the minimum number of coins needed
// to make the target amount. A coin value can be used multiple times.
//
// You've seen this problem before with memoization, but now solve it using the Tabulation strategy!
//
// Examples:
//
// console.log(minChange([1, 2, 5], 11))         // => 3, because 5 + 5 + 1 = 11
// console.log(minChange([1, 4, 5], 8))         // => 2, because 4 + 4 = 8
// console.log(minChange([1, 5, 10, 25], 15))    // => 2, because 10 + 5 = 15
// console.log(minChange([1, 5, 10, 25], 100))   // => 4, because 25 + 25 + 25 + 25 = 100
function minChange(coins, amount) {
  let dp = new Array(amount + 1).fill(Infinity); //fill all elements with values greater than amount, with the exception of index 0
  dp[0] = 0;

  for (let i = 0; i <= amount; i++) {
    for (let j = 0; j < coins.length; j++) {
      if (coins[j] <= i) {
        dp[i] = Math.min(dp[i], 1 + dp[i - coins[j]]);
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}

module.exports = {
  stepper,
  maxNonAdjacentSum,
  minChange,
};
