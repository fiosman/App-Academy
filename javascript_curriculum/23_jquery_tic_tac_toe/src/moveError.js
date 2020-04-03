
const MoveError = function (msg) { this.msg = msg; };

// MoveError really should be a child class of the built in Error object provided
// by Javascript, but since we haven't covered inheritance yet, we'll just
// let it be a vanilla Object for now!

module.exports = MoveError;
