import flatpickr from 'flatpickr';
import "flatpickr/dist/themes/confetti.css";
import { French } from "flatpickr/dist/l10n/fr.js"
flatpickr(".datepicker", {

  altInput: true,
  enableTime: true,
  time_24hr: true,
  inline: true,
  dateFormat: "d-m-Y H:i",
  altFormat: "j F Y à H\\Hi",
  minDate: "today",
  "locale": French
});

