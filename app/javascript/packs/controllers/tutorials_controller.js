import { Controller } from 'stimulus'

export default class extends Controller {

  showDescription(event) {
    event.preventDefault();
    fetch(`/api/v1/videos/${event.target.id}`)
      .then((response) => response.json())
      .then(function(response){
        const desc = document.querySelector(`#description-${event.target.id}`);
        desc.innerHTML = response.description
      });
  }

  updateOrder(event) {
    event.preventDefault();
    fetch(`/admin/api/v1/tutorial_sequencer/${event.target.id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        body: JSON.stringify(sortable.toArray())
      })
      .then((response) => response.json())
      .then(function(response){
        console.log("hello");
      });
  }

}
