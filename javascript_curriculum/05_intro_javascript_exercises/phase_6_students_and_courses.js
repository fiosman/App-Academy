function Student(firstName, lastName) { 
  this.firstName = firstName; 
  this.lastName = lastName; 
  this.courses = []; 
}

Student.prototype.name = function() { 
  return this.firstName.concat(` ${this.lastName}`); 
}

Student.prototype.hasConflict = function(potentialCourse) { 
  for (let i=0; i < this.courses.length; i++) { 
    if (this.courses[i].conflictsWith(potentialCourse)) { 
      return true;
    }
  }

  return false;
}

Student.prototype.enroll = function(course) { 
  if (this.courses.includes(course)) { 
    return 'Already enrolled in course'; 
  } else if (this.hasConflict(course)) { 
    return 'Time conflict detected! Pick another course';
  } else { 
    this.courses.push(course); 
    course.students.push(this);
  }
}

Student.prototype.courseLoad = function () {
  const courseLoad = {}  
  this.courses.forEach(course => { 
    let department = course.department;
    if (courseLoad[department]) { 
      courseLoad[department] += course.credits; 
    } else { 
      courseLoad[department] = course.credits;
    }
  })

  return courseLoad;
}

student = new Student('Fares', 'Osman')
math = new Course('Calculus III', 'Mathematics', 2, ['mon', 'tues', 'wed'], 1);
physics = new Course('Physics', 'Science', 3, ['fri'], 1);
history = new Course('History', 'Arts', 1, ['wed', 'fri'], 1); 
geography = new Course('Geography', 'Arts', 3, ['mon', 'fri'], 3)

function Course(name, department, credits, days, block) { 
  this.name = name; 
  this.department = department; 
  this.credits = credits; 
  this.students = [];
  this.block = block;
  this.days = days;
}

Course.prototype.addStudent = function(student) { 
  student.enroll(this); 
}

Course.prototype.conflictsWith = function (secondCourse) {
  for (let i = 0; i < this.days.length; i++) {
    if (secondCourse.days.includes(this.days[i]) &&
      this.block === secondCourse.block) {
      return true;
    }
  }
  return false;
};

console.log(student.enroll(math));
console.log(student.enroll(math))
console.log(student.enroll(history))
console.log(student.enroll(geography))
console.log(student.courses)


// console.log(student.enroll(math))
// student.enroll(physics)
// student.enroll(geography)
// student.enroll
// console.log(student.courseLoad());
// console.log(history.conflictsWith(math));
// console.log(physics.conflictsWith(math));
