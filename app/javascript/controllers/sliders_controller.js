import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["notes"];

  initialize() {
    this.showSlide(0)
  }

  showIt(e) {
    const index = parseInt(e.currentTarget.dataset.index)
    this.showSlide(index)
  }

  showSlide(index) {
    this.notesTargets.forEach((el, i) => {
      el.classList.toggle("active", index == i)
    })
  }
}
