import "bootstrap";
import 'plugins/flatpickr'

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import { initialization } from '../components/dynamicnavbar';
import { toggleDesc } from '../components/description';

initialization();



if (document.querySelector(".fa-caret-square-down")) {
  toggleDesc();
}
