import "bootstrap";
import 'plugins/flatpickr'

import { navigation } from '../components/slider';

if (document.querySelector(".slider.step2")) {
  navigation();
}


import { foodNav } from '../components/slider-wishlist';

if (document.querySelector(".slider2.sale")) {
  foodNav();
}

import { initialization } from '../components/dynamicnavbar';
initialization();

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();



// import { toggleDesc } from '../components/description';

// if (document.querySelector(".fa-caret-square-down")) {
//   toggleDesc();
// }


