const sale1 = document.querySelector(".nav11");
const sucre1 = document.querySelector(".nav22");
const soft1 = document.querySelector(".nav33");
const alcool1 = document.querySelector(".nav44");
const slider2 = document.querySelector(".slider2.sale");
const carre = document.querySelector(".small-square")

function clear() {

  sale1.classList.remove("selected");
  sucre1.classList.remove("selected");
  soft1.classList.remove("selected");
  alcool1.classList.remove("selected");

  carre.classList.remove("pos1");
  carre.classList.remove("pos2");
  carre.classList.remove("pos3");
  carre.classList.remove("pos4");

  slider2.classList.remove("sale");
  slider2.classList.remove("sucre");
  slider2.classList.remove("soft");
  slider2.classList.remove("alcool");
}

function navSale() {
  clear();
  slider2.classList.add("sale");
  sale1.classList.add("selected");
  carre.classList.add("pos1");
}

function navSucre() {
  clear();
  slider2.classList.add("sucre");
  sucre1.classList.add("selected");
  carre.classList.add("pos2");
}

function navSoft() {
  clear();
  slider2.classList.add("soft");
  soft1.classList.add("selected");
  carre.classList.add("pos3");
}

function navAlcool() {
  clear();
  slider2.classList.add("alcool");
  alcool1.classList.add("selected");
  carre.classList.add("pos4");
}

const foodNav = () => {
  sale1.addEventListener("click", navSale);
  sucre1.addEventListener("click", navSucre);
  soft1.addEventListener("click", navSoft);
  alcool1.addEventListener("click", navAlcool);
}

export { foodNav };
