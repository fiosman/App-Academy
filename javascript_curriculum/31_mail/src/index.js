document.addEventListener('DOMContentLoaded', function() { 
  const navItems = document.querySelectorAll(".sidebar-nav li"); 
  navItems.forEach(item => { 
    item.addEventListener("click", function() { 
      const newLoc = item.innerText.toLowerCase(); 
      window.location.hash = newLoc;
    })
  })
})