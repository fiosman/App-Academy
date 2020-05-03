const Inbox = { 
  render: () => { 
    const container = document.createElement("ul"); 
    container.className = "messages"; 
    container.innerHTML = "An Inbox Messaage"; 
    return container;
  }
}

module.exports = Inbox; 