const APIUtil = require("./api_util.js");

class TweetCompose {
  constructor($form) {
    this.$form = $form;
    this.$form.on("submit", this.submit.bind(this));
    this.$form.find("textarea").on("input", (e) => {
      let maxCharCount = 140;
      let currentTextLength = e.currentTarget.value.length;
      let currentCharCount = maxCharCount - currentTextLength;
      this.$form
        .find("strong.chars-left")
        .text(`${currentCharCount} characters left`);
    });
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
  }

  handleSuccess(data) {
    this.clearInput();
    const $disabledInputs = this.$form.find(":input:disabled");
    $disabledInputs.removeAttr("disabled");

    const $targetUl = this.$form.data("tweets-ul");
    const tweet = JSON.stringify(data);

    $($targetUl).prepend(`<li>${tweet}</li>`);
  }
}

module.exports = TweetCompose;
