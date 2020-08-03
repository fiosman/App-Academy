// Work through this problem on https://leetcode.com/problems/coin-change-2/ and use the specs given there.
// Feel free to use this file for scratch work.

//You are given coins of different denominations and a total amount of money.
//Write a function to compute the number of combinations that make up that amount.
//You may assume that you have infinite number of each kind of coin.

//Examples:
//Input: amount = 5, coins = [1, 2, 5]
//Output: 4

//Input: amount = 3, coins = [2];
//Output: 0

//Input: (amount = 10), (coins = [10]);
//Output: 1

function change(amount, coins, memo = {}) {
  let key = amount + "-" + coins;
  if (key in memo) return memo[key];

  if (amount === 0) return 1;

  let total = 0;

  for (let i = coins.length - 1; i >= 0; i--) {
    let currentCoin = coins[i];
    if (currentCoin > amount) {
      continue;
    } else {
      total += change(amount - currentCoin, coins.slice(i, coins.length), memo);
    }
  }
  memo[key] = total;
  return memo[key];
}

// console.log(change(500, [1, 2, 5, 10, 25]));
// console.log(change(3, [2]));
// console.log(change(10, [10]));
