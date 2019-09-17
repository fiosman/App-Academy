window.onload = function() {
  (function reviewFormListener() {
    form = document.getElementById("review-form");
    form.addEventListener("submit", placeReview);
  })();
};

var placeReview = function(event) {
  event.preventDefault();
  var reviewElement = createReview(event);
  var reviewSection = document.getElementById('reviews');
  reviewSection.insertBefore(reviewElement, reviewSection.childNodes[2]);
};

var createReview = function(event) {
  var name = document.createTextNode(getName(event));
  var rating = document.createTextNode(getRating(event));
  var expertise = document.createTextNode(getExpertise(event));
  var review = document.createTextNode(getReview(event));

  var nameHeader = document.createElement('h4');
  var ratingParagraph = document.createElement('p');
  var expertiseParagraph = document.createElement('p');
  var reviewParagraph = document.createElement('p');

  nameHeader.appendChild(name);
  ratingParagraph.appendChild(rating);
  expertiseParagraph.appendChild(expertise);
  reviewParagraph.appendChild(review);

  var reviewElements = [nameHeader, ratingParagraph, expertiseParagraph, reviewParagraph];
  var reviewElement = document.createElement('div');
  reviewElements.forEach(function(el) {
    reviewElement.appendChild(el);
  });
  reviewElement.id = name.textContent + '_review';
  reviewElement.className = 'user_review';

  return reviewElement;
};

var getName = function(event) {
  return event.target.children.name.value;
};

var getRating = function(event) {
  var ratingScore;
  var formChildren = event.target.children;
  for (var i = 0; i < formChildren.length; i++) {
    if (formChildren[i].type === "radio" && formChildren[i].checked) {
      ratingScore = formChildren[i].value;
    }
  }

  return 'Rating: ' + ratingScore;
};

var getExpertise = function(event) {
  var dropdown = event.target.children.expertise;
  return 'Expertise: ' + dropdown.options[dropdown.selectedIndex].text;
};

var getReview = function(event) {
  var reviewText;
  var formChildren = event.target.children;
  for (var i = 0; i < formChildren.length; i++) {
    if (formChildren[i].tagName === "LABEL" && formChildren[i].children[0]) {
      reviewText = formChildren[i].children[0].value;
    }
  }

  return reviewText;
};
