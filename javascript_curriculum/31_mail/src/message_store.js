let messages = {
  sent: [
    {
      to: "friend@mail.com",
      subject: "Check this out",
      body: "It's so cool",
    },
    { to: "person@mail.com", subject: "zzz", body: "so booring" },
  ],
  inbox: [
    {
      from: "grandma@mail.com",
      subject: "Fwd: Fwd: Fwd: Check this out",
      body: "Stay at home mom discovers cure for leg cramps. Doctors hate her",
    },
    {
      from: "person@mail.com",
      subject: "Questionnaire",
      body: "Take this free quiz win $1000 dollars",
    },
  ],
};

const MessageStore =  { 
  getInboxMessages: () => { 
    return messages.inbox;
  }, 
  getSentMessages: () => { 
    return messages.sent;
  }
}

module.exports = MessageStore; 