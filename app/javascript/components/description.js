const description = document.querySelector(".fa-caret-square-down");

function openDesc() {
  document.getElementById("description-details").style.height = '100%';
  // document.getElementById("description-content").style.visibility = 'visible';
  // document.getElementById("description-content").style.opacity = "1";
  // document.getElementById("description-content").style.marginTop = '5%';
  document.querySelector(".description-content").classList.toggle('description-content--show')
  description.classList.toggle('fa-minus-square');
  // document.getElementById("rest-of-content").style.marginTop = "25%";
}

// function closeDesc() {
//   document.getElementById("description-details").style.visibility = 'hidden';
//   document.getElementById("description-details").style.height = '0%';
//   document.getElementById("rest-of-content").style.marginTop = "250px";
// }



const toggleDesc = () => {
  description.addEventListener("click", openDesc);
  // croix.addEventListener("click", closeNav);
};

export { toggleDesc };
