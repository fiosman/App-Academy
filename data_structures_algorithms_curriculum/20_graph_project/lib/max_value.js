function maxValue(node, visited = new Set()) {
  let queue = [node];
  let currMax = node.val;

  while (queue.length) {
    let potentialNode = queue.shift();

    if (visited.has(potentialNode)) continue;
    visited.add(potentialNode);

    if (potentialNode.val > currMax) {
      currMax = potentialNode.val;
    }

    if (potentialNode.neighbors.length > 0) {
      queue.push(...potentialNode.neighbors);
    }
  }

  return currMax;
}

module.exports = {
  maxValue,
};
