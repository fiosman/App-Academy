const MessageStore = require("./message_store.js");

const Inbox = {
  render: function() {
    const inboxMessages = MessageStore.getInboxMessages();
    const container = document.createElement("ul");

    inboxMessages.forEach((message) => {
      const node = this.renderMessage(message); 
      container.appendChild(node);
    });
    container.className = "messages";
    return container;
  },

  renderMessage: function(message) {
    let liNode = document.createElement("li");
    liNode.className = "message";
    let from = `<span class='from'> ${message.from} </span>`;
    let subject = `<span class='subject'> ${message.subject} </span>`;
    let body = `<span class='body'> ${message.body} </span>`;
    liNode.innerHTML = from + subject + body;
    return liNode;
  },
};

module.exports = Inbox;
