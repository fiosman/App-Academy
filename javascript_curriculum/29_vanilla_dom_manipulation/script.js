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
    const newItem = document.createElement("li");
    newItem.appendChild(input);
    places.appendChild(newItem);
    inputField.value = "";
  });

  // adding new photos

  // --- your code here!
});
