const Router = require("./router.js");
const Inbox = require("./inbox.js");

const routes = { 
  inbox: Inbox
}

document.addEventListener("DOMContentLoaded", function () {
  const navItems = document.querySelectorAll(".sidebar-nav li");
  const content = document.querySelector(".content");
  new Router(content, routes).start();
  navItems.forEach((item) => {
    item.addEventListener("click", function () {
      const newLoc = item.innerText.toLowerCase();
      window.location.hash = newLoc;
    });
  });
});
