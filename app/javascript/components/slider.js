const mesMeals = document.querySelector(".nav1.icons");
const participe = document.querySelector(".nav2.icons");
const nouveaux = document.querySelector(".nav3.icons");
const slider = document.querySelector(".slider.step2");


function clear() {
  mesMeals.classList.remove("selected");
  participe.classList.remove("selected");
  nouveaux.classList.remove("selected");

  slider.classList.remove("step1");
  slider.classList.remove("step2");
  slider.classList.remove("step3");
}

function myMeals() {
  clear();
  slider.classList.add("step1");
  mesMeals.classList.add("selected");
}

function attendance() {
  clear();
  slider.classList.add("step2");
  participe.classList.add("selected");
}

function newEvents() {
  clear();
  slider.classList.add("step3");
  nouveaux.classList.add("selected");
}

const navigation = () => {
  nouveaux.addEventListener("click", newEvents);
  participe.addEventListener("click", attendance);
  mesMeals.addEventListener("click", myMeals);
}

export { navigation };
