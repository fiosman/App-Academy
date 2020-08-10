// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

function minPathSum(grid) {
  //tabulation solution --- bottom-up approach

  let rows = grid.length;
  let cols = grid[0].length;
  let dp = new Array(rows).fill().map(() => new Array(cols));
  dp[0][0] = grid[0][0];

  //edge case to handle first row;
  for (let i = 1; i < grid[0].length; i++) {
    dp[0][i] = grid[0][i] + dp[0][i - 1];
  }

  for (let row = 1; row < rows; row++) {
    dp[row][0] = grid[row][0] + dp[row - 1][0]; //edge case to handle first column
    for (let col = 1; col < cols; col++) {
      //minimum value of already calculated minPathSum of previous indices 1 row up or 1 col to left
      dp[row][col] = grid[row][col] + Math.min(dp[row - 1][col], dp[row][col - 1]);
    }
  }
  return dp[rows - 1][cols - 1];
}

console.log(
  minPathSum([
    [1, 3, 1],
    [1, 5, 1],
    [4, 2, 1],
  ])
);
