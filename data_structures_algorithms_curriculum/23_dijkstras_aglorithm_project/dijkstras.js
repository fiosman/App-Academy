function dijkstras(graph, source) {
	//find the minimum distance from source node to all other nodes in the graph
	//also outputs the path to optimal distance (i.e. nodes to traverse)
  let distance = {};

  for (let node in graph) {
    distance[node] = Infinity;
  }

  distance[source] = 0;

  let unvisitedNodes = new Set(Object.keys(graph));
  let previous = {};

  while (unvisitedNodes.size > 0) {
    let currNode = getSmallestNode(unvisitedNodes, distance);
    unvisitedNodes.delete(currNode);

    for (let neighbor in graph[currNode]) {
      let distanceToNeighbor = graph[currNode][neighbor];
      let totalDistance = distance[currNode] + distanceToNeighbor;

      if (totalDistance < distance[neighbor]) {
        distance[neighbor] = totalDistance;
        previous[neighbor] = currNode;
      }
    }
  }

  return { distance, previous };
}

//select node with minimum distance
function getSmallestNode(unvisited, distance) {
  let unvisitedArr = [...unvisited]; //contains all keys in graph; distance has each distance assigned to that key
  let smallest = unvisitedArr[0];

  for (let i = 1; i < unvisitedArr.length; i++) {
    if (distance[unvisitedArr[i]] < distance[smallest]) {
      smallest = unvisitedArr[i];
    }
  }

  return smallest;
}

let dist = { a: 5, b: 2, c: 1 };
let unvisited = new Set(["a", "b", "c"]);

console.log(getSmallestNode(unvisited, dist));

let graph = {
  a: { c: 1, b: 7 },
  b: { a: 7, d: 12, e: 13 },
  c: { a: 1, d: 20, f: 4 },
  d: { b: 12, c: 20, e: 5 },
  e: { b: 13, d: 5, f: 9 },
  f: { c: 4, e: 9 },
};

// console.log(dijkstras(graph, 'a'));
