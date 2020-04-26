document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const handleSubmitPlace = (e) => {
    e.preventDefault();
    const inputField = document.querySelector(".favorite-input");
    const places = document.getElementById("sf-places");
    const input = document.createTextNode(`${inputField.value}`);
    const newLi = document.createElement("li");

    newLi.appendChild(input);
    places.appendChild(newLi);
    inputField.value = "";
  };

  const submitButton = document.querySelector(".favorite-submit");
  submitButton.addEventListener("click", handleSubmitPlace);

  // adding new photos

  const photoToggleHandler = () => {
    document.querySelector(".photo-form-container").classList.toggle("hidden");
  };

  const photoToggle = document.querySelector(".photo-show-button");
  photoToggle.addEventListener("click", photoToggleHandler);

  const photoSubmitHandler = (e) => {
    const photoUl = document.querySelector(".dog-photos");
    const photoInput = document.querySelector(".photo-url-input");

    e.preventDefault();
    const newLi = document.createElement("li");
    const newImg = document.createElement("img");
    newImg.setAttribute("src", photoInput.value);
    newLi.appendChild(newImg);
    photoUl.appendChild(newLi);
    photoInput.value = "";
  };

  const photoSubmitBtn = document.querySelector(".photo-url-submit");
  photoSubmitBtn.addEventListener("click", photoSubmitHandler);
});
