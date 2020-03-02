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