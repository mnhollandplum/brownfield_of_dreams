import { Controller } from 'stimulus'

export default class extends Controller {

  showVideo(event) {
    event.preventDefault();
    console.log("hello!");
  }


  showDescription(event) {
    event.preventDefault();
    fetch(`/api/v1/videos/${event.target.id}`)
      .then((response) => response.json())
      .then(function(response){
        const desc = document.querySelector(`#description-${event.target.id}`);
        desc.innerHTML = response.description
      });
  }

}
