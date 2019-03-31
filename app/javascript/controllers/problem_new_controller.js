import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide" ]

  initialize() {
    this.showCurrentSlide()
    console.log('initialize called')
    console.log(this.index)
    console.log(this.data.get('index'))
  }

  next(event) {
    console.log(event)
    if(event.code == "Enter"){
    event.preventDefault();
          
        this.index++
    }
  }

  previous(event) {
    this.index--
  }

  showCurrentSlide() {
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", this.index == i)
    })
  }

  get index() {
    return parseInt(this.data.get("index"))
  }

  set index(value) {
    this.data.set("index", value)
    this.showCurrentSlide()
  }
}