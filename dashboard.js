function toggleDropdown() {
    var dropdown = document.getElementById("dropdown");
    dropdown.classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
    if (!event.target.matches('.user-btn')) {
        var dropdown = document.getElementById("dropdown");
        if (dropdown.classList.contains('show')) {
            dropdown.classList.remove('show');
        }
    }
};
document.addEventListener("DOMContentLoaded", function() {
    // Get a reference to the "Home" button
    var homeButton = document.getElementById("homeButton");

    // Add a click event listener to the button
    homeButton.addEventListener("click", function(event) {
        event.preventDefault(); // Prevent the default link behavior

        // Show the error popup
        alert("Note: you are already on the home page");
    });
});
