const nouveaux = document.querySelector(".nav1");
const participe = document.querySelector(".nav2");
const mesMeals = document.querySelector(".nav3");
const slider = document.querySelector(".slider.step2");

function clear() {
  slider.classList.remove("step1");
  slider.classList.remove("step2");
  slider.classList.remove("step3");
}

function newEvents() {
  clear();
  slider.classList.add("step1");
}

function attendance() {
  clear();
  slider.classList.add("step2");
}

function myMeals() {
  clear();
  slider.classList.add("step3");
}

const navigation = () => {
  nouveaux.addEventListener("click", newEvents);
  participe.addEventListener("click", attendance);
  mesMeals.addEventListener("click", myMeals);
}

export { navigation };
