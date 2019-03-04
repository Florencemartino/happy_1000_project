import "bootstrap";
import 'plugins/flatpickr'

// Slider for the events#index
import { navigation } from '../components/slider';

if (document.querySelector(".slider.step2")) {
  navigation();
}

// Slider for the whishlist#index
import { foodNav } from '../components/slider-wishlist';

if (document.querySelector(".slider2.sale")) {
  foodNav();
}

// Slide navbar
import { initialization } from '../components/dynamicnavbar';
initialization();

// Autocomplete for address in event creation
import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();



// import { toggleDesc } from '../components/description';

// if (document.querySelector(".fa-caret-square-down")) {
//   toggleDesc();
// }


