/**
 * 
 */
// event listener for sidebar close button
document.getElementById("sidebar-close").onclick = function () {
    sidebar = document.getElementById("floating-sidebar");
    sidebar.classList.toggle("show-sidebar");
};

// event listener for sidebar open button
document.getElementById("sidebar-open").onclick = function () {
    sidebar = document.getElementById("floating-sidebar");
    sidebar.classList.toggle("show-sidebar");
};
