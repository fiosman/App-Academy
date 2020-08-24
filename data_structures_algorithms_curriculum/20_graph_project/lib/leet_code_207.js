// View the full problem and run the test cases at:
//  https://leetcode.com/problems/course-schedule/

function createGraph(prereqs) {
  let adjacencyList = {};

  prereqs.forEach((prereq) => {
    let [courseToTake, req] = prereq;
    if (courseToTake in adjacencyList) {
      adjacencyList[courseToTake].push(String(req));
    } else {
      adjacencyList[courseToTake] = [String(req)];
    }

    if (!(req in adjacencyList)) {
      adjacencyList[req] = [];
    }
  });

  return adjacencyList;
}

function canFinish(numCourses, prerequisites) {}

console.log(createGraph([[1, 0]]));
