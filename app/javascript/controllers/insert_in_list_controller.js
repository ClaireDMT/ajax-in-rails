import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["form", "items"]
  static values = { position: String }
  connect() {
    console.log(this.formTarget.action)
    // console.log(this.itemsTarget)
  }

  send(event) {
    event.preventDefault()
    const url = this.formTarget.action
    const options = {
      method: "POST",
      headers: { "Accept": "application/json"},
      body: new FormData(this.formTarget)
    }

    fetch(url, options)
    .then(response => response.json())
    .then(data => {
      /* replace the new form in place of the actual */
      this.formTarget.outerHTML = data.form
      /* insert the new review in the list */
      this.itemsTarget.insertAdjacentHTML(this.positionValue, data.item)
    })
  }
}
