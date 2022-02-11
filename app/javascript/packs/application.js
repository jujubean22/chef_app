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


document.addEventListener('turbolinks:load', function() {
  // Mobile Menu Initialization
  var mySidenav = document.querySelectorAll('.sidenav');
  var options_sidenav = {
    edge: 'left'
  }
  var instance_sidenav = M.Sidenav.init(mySidenav, options_sidenav);

  // Material Box Initialization (Clickable Image)
  var myImages = document.querySelectorAll('.materialboxed');
  var options_images = {
    inDuration: 200  
  }
  var instance_images = M.Materialbox.init(myImages, options_images);

  // Tabs Initialization
  var myTabs = document.querySelectorAll('.tabs');
  var options_tabs = {
    swipeable: true,
    duration: 200
  }
  var instance_tabs = M.Tabs.init(myTabs, options_tabs);

  // Modal Initialization
  var myModals = document.querySelectorAll('.modal');
  var options_modals = {
    preventScrolling: true,
    dismissible: true
  }
  var instance_modals = M.Modal.init(myModals, options_modals);
});
