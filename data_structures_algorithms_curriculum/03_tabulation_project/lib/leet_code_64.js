// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

function minPathSum(grid) {
  let m = grid.length;
  let n = grid[0].length;
  let dp = new Array(m).fill().map(() => new Array(n));
  dp[0][0] = grid[0][0];

  for (let i = 0; i < grid.length; i++) {
    for (let j = 0; j < grid[i].length; j++) {
      if (i === 0) {
        dp[i][j] += dp[i][j - 1];
      } else if (j === 0) {
        dp[i][j] += dp[i - 1][j];
      } else {
        dp[i][j] = Math.min(dp[i - 1][j], dp[j][i - 1]);
      }
    }
  }

  return dp[m - 1][n - 1];
}

console.log(
  minPathSum([
    [1, 3, 1],
    [1, 5, 1],
    [4, 2, 1],
  ])
);
