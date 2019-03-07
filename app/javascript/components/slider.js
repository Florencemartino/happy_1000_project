const mesMeals = document.querySelector(".nav1.icons");
const participe = document.querySelector(".nav2.icons");
// const nouveaux = document.querySelector(".nav3.icons");
const slider = document.querySelector(".slider");
const carre = document.querySelector(".small-square")


function clear() {
  mesMeals.classList.remove("selected");
  participe.classList.remove("selected");
  // nouveaux.classList.remove("selected");

  carre.classList.remove("carre1");
  carre.classList.remove("carre2");
  // carre.classList.remove("carre3");

  slider.classList.remove("step1");
  slider.classList.remove("step2");
  // slider.classList.remove("step3");
}

function myMeals() {
  clear();
  slider.classList.add("step1");
  mesMeals.classList.add("selected");
  carre.classList.add("carre1");
}

function attendance() {
  clear();
  slider.classList.add("step2");
  participe.classList.add("selected");
  carre.classList.add("carre2");
}

// function newEvents() {
//   clear();
//   slider.classList.add("step3");
//   nouveaux.classList.add("selected");
//   carre.classList.add("carre3");
// }

const navigation = () => {
  // nouveaux.addEventListener("click", newEvents);
  participe.addEventListener("click", attendance);
  mesMeals.addEventListener("click", myMeals);
}

export { navigation };
