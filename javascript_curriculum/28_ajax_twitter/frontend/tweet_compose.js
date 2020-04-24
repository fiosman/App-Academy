const APIUtil = require("./api_util.js");

class TweetCompose {
  constructor($form) {
    this.$form = $form;
    this.$form.find("textarea").on("input", this.handleInput.bind(this));
    this.$form.find(".add-mention").on("click", this.newUserSelect.bind(this));
    this.$mentionedUsersUl = this.$form.find(".mentioned-users");
    this.$mentionedUsersUl.on(
      "click",
      ".remove-mentioned-user",
      this.removeMentionedUser.bind(this)
    );
    this.$form.on("submit", this.submit.bind(this));
  }

  handleInput(e) {
    let maxCharCount = 140;
    let currentTextLength = e.currentTarget.value.length;
    let currentCharCount = maxCharCount - currentTextLength;

    this.$form
      .find("strong.chars-left")
      .text(`${currentCharCount} characters left`);
  }

  submit(e) {
    e.preventDefault();
    const $formInputs = this.$form.find(":input");
    const $formData = $(e.currentTarget).serialize();

    $formInputs.prop("disabled", true);
    APIUtil.createTweet($formData).then(this.handleSuccess.bind(this));
  }

  clearInput() {
    const $formInputs = this.$form.find(
      ":input:not(input[type='Submit'], input[type='hidden'])"
    );
    $formInputs.val("");

    this.$mentionedUsersUl.empty();
  }

  handleSuccess(data) {
    this.clearInput();
    const $disabledInputs = this.$form.find(":input:disabled");
    $disabledInputs.removeAttr("disabled");

    const $targetUl = this.$form.data("tweets-ul");
    const tweet = JSON.stringify(data);

    $($targetUl).prepend(`<li>${tweet}</li>`);
  }

  newUserSelect() {
    const $selectEle = $("<select name='tweet[mentioned_user_ids][]'>");
    const $wrapper = $("<div>");
    const $removeMentionedUser = $('<button type="button">')
      .html("Remove")
      .addClass("remove-mentioned-user");
    const users = window.users;

    users.forEach((user) => {
      $selectEle.append(`<option value=${user.id}>${user.username}</option>`);
    });
    $wrapper.append($selectEle).insertAfter("textarea");
    $wrapper.append($removeMentionedUser);
    this.$mentionedUsersUl.append($wrapper);
  }

  removeMentionedUser(e) {
    $(e.currentTarget).parent().remove();
  }
}

module.exports = TweetCompose;
