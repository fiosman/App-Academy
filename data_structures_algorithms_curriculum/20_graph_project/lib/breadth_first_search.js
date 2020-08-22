function breadthFirstSearch(startingNode, targetVal, visited = new Set()) {
  let queue = [startingNode];

  while (queue.length) {
    let potentialNode = queue.shift();

    if (visited.has(potentialNode)) continue;
    visited.add(potentialNode);

    if (potentialNode.val === targetVal) return potentialNode;

    queue.push(...potentialNode.neighbors);
  }

  return null;
}

module.exports = {
  breadthFirstSearch,
};

// let u = new GraphNode("u");
// let v = new GraphNode("v");
// let w = new GraphNode("w");
// u.neighbors = [v];
// v.neighbors = [u, w];
// expect(breadthFirstSearch(u, "w")).to.equal(w);
