function toggle() {
  var content = document.getElementById('toggle-div');
  // console.log('I clicked toggle!')
  if (content.style.display == 'none') {
    // console.log('None now, toggle to block')
    content.style.display = 'block';
    document.getElementById('toggle-btn').value = 'Hide service form';
  } else {
    // console.log('Block now, toggle to none')
    content.style.display = 'none';
    document.getElementById('toggle-btn').value = 'Add new service';
  }
}

document.addEventListener('turbolinks:load', () => {
  const clickButton = document.getElementById('toggle-btn');
  clickButton.addEventListener('click', (event) => {
    toggle()
  });
});

// console.log('Hello from toggle.js')
