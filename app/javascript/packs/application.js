import "bootstrap";
import 'plugins/flatpickr'

import { navigation } from '../components/slider';
navigation();

import { initialization } from '../components/dynamicnavbar';
initialization();

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();



// import { toggleDesc } from '../components/description';

// if (document.querySelector(".fa-caret-square-down")) {
//   toggleDesc();
// }


