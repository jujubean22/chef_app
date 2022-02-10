function toggle(e) {
  if (e.target.id == 'toggle-service')
    id = 'service-form';
  else if (e.target.id == 'toggle-gallery')
    id = 'gallery-form';

  var content = document.getElementById(`${id}`);
  if (content.style.display == 'none') {
    content.style.display = 'block';
    document.getElementById(`${e.target.id}`).value = id == 'service-form' ? 'Hide service form' : 'Hide gallery form';
    document.getElementById(`${e.target.id}`).className = 'btn-small btn-hide';
  } else {
    content.style.display = 'none';
    document.getElementById(`${e.target.id}`).value = id == 'service-form' ? 'Add new service' : 'Add new photo';
    document.getElementById(`${e.target.id}`).className = 'btn-small btn-show';
  }
}

document.addEventListener('turbolinks:load', () => {
  const serviceButton = document.getElementById('toggle-service');
  const galleryButton = document.getElementById('toggle-gallery');
  
  serviceButton.addEventListener('click', (e) => {
    toggle(e)
  });
  
  galleryButton.addEventListener('click', (e) => {
    toggle(e)
  });
});

// console.log('Hello from toggle.js')
