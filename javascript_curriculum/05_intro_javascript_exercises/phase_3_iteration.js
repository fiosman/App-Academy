String.prototype.substrings = function () {
  let substrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }

  return substrings;
}
