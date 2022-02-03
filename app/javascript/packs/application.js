// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs
//= require materialize-sprockets

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "@fortawesome/fontawesome-free/css/all"

// Mobile Menu Initialization

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.sidenav');
  var options = {
    edge: 'left'
  }
  var instances = M.Sidenav.init(elems, options);

  // see materializecss.com for details on options
  // var instances = M.Sidenav.init(elems, options);
});

// Material Box Initialization (Clickable Image)

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.materialboxed');
  var options = {
    inDuration: 200  
  }
  var instances = M.Materialbox.init(elems, options);
});

console.log('Hello from application.js')
