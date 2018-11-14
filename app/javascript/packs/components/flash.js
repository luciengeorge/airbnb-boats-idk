const closeButton = document.querySelectorAll(".close");
closeButton.forEach((button) => {
  button.addEventListener("click", () => {
    const margin = document.querySelector(".margin-div");
    margin.classList.remove("alert-warning");
    margin.classList.remove("alert-info");
  });
});
