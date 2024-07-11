import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["event"]

  connect() {
  }

  accept() {
    const eventId = this.eventTarget.value
    console.log("aceptando", eventId)
    const path = `/events/${eventId}/accept_invitation`
    axios.post(path).then(() => window.location = '/events')
  }

  reject() {
    console.log("Rechazando")
  }
}
