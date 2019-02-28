const ouverture = document.getElementById("bars");
const croix = document.getElementById("boutton-croix");
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
}

const initialization = () => {
  ouverture.addEventListener("click", openNav);
  croix.addEventListener("click", closeNav);
};

export { initialization };
