import { Controller } from 'stimulus'

export default class extends Controller {
  showDescription(event) {
    event.preventDefault();
    alert("Hi Tyler!")
  }
}
