const toggleBtn = document.querySelector("#toggle-btn");

toggleBtn.addEventListener("click", function() {
    document.querySelector("#sidebar").classList.toggle("expand");
});
