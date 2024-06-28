import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const form = this.element
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  }
}