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

  const submitButton = document.querySelector(".favorite-submit");
  const inputField = document.querySelector(".favorite-input");
  const places = document.getElementById("sf-places");

  submitButton.addEventListener("click", (e) => {
    e.preventDefault();
    const input = document.createTextNode(`${inputField.value}`);
    const newLi = document.createElement("li");
    newLi.appendChild(input);
    places.appendChild(newLi);
    inputField.value = "";
  });

  // adding new photos
  const photoToggle = document.querySelector(".photo-show-button");

  photoToggle.addEventListener("click", (e) => {
    e.preventDefault();
    document.querySelector(".photo-form-container").classList.toggle("hidden");
  });

  const photoSubmit = document.querySelector(".photo-url-submit");
  const photoUl = document.querySelector(".dog-photos");
  const photoInput = document.querySelector(".photo-url-input");

  photoSubmit.addEventListener("click", (e) => {
    e.preventDefault();
    const newLi = document.createElement("li");
    const newImg = document.createElement("img");
    newImg.setAttribute("src", photoInput.value);
    newLi.appendChild(newImg);
    photoUl.appendChild(newLi);
    photoInput.value = "";
  });
});
