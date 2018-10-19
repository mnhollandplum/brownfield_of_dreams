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

  showVideoForm(event) {
    event.preventDefault();
    // Get the natural height of the element
    var elem = document.getElementById("new-video-form");
    var getHeight = function () {
      elem.style.display = 'block'; // Make it visible
      var height = elem.scrollHeight + 'px'; // Get it's height
      elem.style.display = ''; //  Hide it again
      return height;
    };

    var height = getHeight(); // Get the natural height
    elem.classList.add('is-visible'); // Make the element visible
    elem.style.height = height; // Update the max-height

    // Once the transition is complete, remove the inline max-height so the content can scale responsively
    window.setTimeout(function () {
      elem.style.height = '';
    }, 350);
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
