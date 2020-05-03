const Router = function (node, routes) {
  this.node = node;
  this.routes = routes;
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
  const currentName = window.location.hash.slice(1);
  return this.routes[currentName];
};

Router.prototype.render = function () {
  const component = this.activeRoute();

  if (!component) {
    this.node.innerHTML = "";
  } else {
    this.node.innerHTML = "";
    const newNode = component.render();
    this.node.appendChild(newNode);
  }
};

module.exports = Router;
