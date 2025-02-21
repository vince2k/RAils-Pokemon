// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Pour les styles

document.addEventListener("DOMContentLoaded", function () {
  flatpickr(".datepicker", {
    dateFormat: "Y-m-d", // Format de la date
  });
});
