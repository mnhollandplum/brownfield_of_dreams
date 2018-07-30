import { Controller } from 'stimulus'

export default class extends Controller {
  showDescription(event) {
    event.preventDefault();
    fetch("/api/v1/tutorials/${tutorial.id}")
      .then((response) => response.json())
      .then((response) => console.log(response))
  }


}
