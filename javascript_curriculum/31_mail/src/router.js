const Router = function (node) {
  this.node = node;
};

Router.prototype.start = function () {
  this.render();
  window.addEventListener(
    "hashchange",
    () => {
      this.render();
    },
    false
  );
};

Router.prototype.activeRoute = function () {
  return window.location.hash.slice(1);
};

Router.prototype.render = function () {
  this.node.innerHTML = "";
  const newRoute = this.activeRoute();
  const newNode = document.createElement("p");
  newNode.innerHTML = newRoute;
  this.node.appendChild(newNode);
};

module.exports = Router;
