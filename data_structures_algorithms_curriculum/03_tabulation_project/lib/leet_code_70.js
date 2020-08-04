// Work through this problem on https://leetcode.com/problems/climbing-stairs/ and use the specs given there.
// Feel free to use this file for scratch work.

function climbStairs(n) {
  let dp = new Array(n + 1); 
  dp[0] = 1; 
  dp[1] = 1;

  for (let i = 2; i <= n; i++) { 
    dp[i] = dp[i - 1] + dp[i - 2]; 
  }

  return dp[n];
}

