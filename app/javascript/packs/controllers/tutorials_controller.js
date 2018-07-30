import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["tutorial"]

  showDescription(event) {
    event.preventDefault();
    fetch(`/api/v1/tutorials/${event.target.id}`)
      .then((response) => response.json())
      .then(function(response){
        const desc = document.querySelector(`#description-${event.target.id}`);
        desc.innerHTML = response.description
      });

  }




}
