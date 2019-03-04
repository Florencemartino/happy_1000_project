const sale1 = document.querySelector(".nav11");
const sucre1 = document.querySelector(".nav22");
const soft1 = document.querySelector(".nav33");
const alcool1 = document.querySelector(".nav44");
const slider2 = document.querySelector(".slider2.sale");

function clear() {
  slider2.classList.remove("sale");
  slider2.classList.remove("sucre");
  slider2.classList.remove("soft");
  slider2.classList.remove("alcool");
}

function navSale() {
  clear();
  slider2.classList.add("sale");
}

function navSucre() {
  clear();
  slider2.classList.add("sucre");
}

function navSoft() {
  clear();
  slider2.classList.add("soft");
}

function navAlcool() {
  clear();
  slider2.classList.add("alcool");
}

const foodNav = () => {
  sale1.addEventListener("click", navSale);
  sucre1.addEventListener("click", navSucre);
  soft1.addEventListener("click", navSoft);
  alcool1.addEventListener("click", navAlcool);
}

export { foodNav };
