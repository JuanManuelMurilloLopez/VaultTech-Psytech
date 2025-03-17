const toggleBtn = document.querySelector('#toggle-btn');

toggleBtn.addEventListener("click", () => {
    document.querySelector("#sidebar").classList.toggle("expand");
});
