const MessageStore = require("./message_store.js");

const Sent = {
  render: function () {
    const inboxMessages = MessageStore.getSentMessages();
    const container = document.createElement("ul");

    inboxMessages.forEach((message) => {
      const node = this.renderMessage(message);
      container.appendChild(node);
    });
    container.className = "messages";
    return container;
  },

  renderMessage: function (message) {
    let liNode = document.createElement("li");
    liNode.className = "message";
    let from = `<span class='to'>To: ${message.to} </span>`;
    let subject = `<span class='subject'> ${message.subject} </span>`;
    let body = `<span class='body'> ${message.body} </span>`;
    liNode.innerHTML = from + subject + body;
    return liNode;
  },
};

module.exports = Sent;
