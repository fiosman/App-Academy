function depthFirst(node, graph, visited) {
  if (visited.has(node)) return;

  visited.add(node);

  graph[node].forEach((neighbor) => {
    depthFirst(neighbor, graph, visited);
  });

  return true;
}

function numRegions(graph) {
  let visited = new Set();
  let componentCount = 0;

  for (let node in graph) {
    if (depthFirst(node, graph, visited)) componentCount++;
  }
  return componentCount;
}

module.exports = {
  numRegions,
};
