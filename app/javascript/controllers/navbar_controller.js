import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("stimulus connected!")
  }

  updateNavbar() {
    if (window.scrollY >= 100) {
      this.element.classList.add("navbar-lewagon-small")
      this.element.classList.remove("navbar-lewagon")
    } else {
      this.element.classList.remove("navbar-lewagon-small")
      this.element.classList.add("navbar-lewagon")
    }
  }
}