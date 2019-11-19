// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require_tree .

$(function() {
  $(".nav-button").on("click", function() {
    if ($(this).hasClass("active")) {
      $(this).removeClass("active");
      $(".nav-wrap")
        .addClass("close")
        .removeClass("open");
    } else {
      $(this).addClass("active");
      $(".nav-wrap")
        .addClass("open")
        .removeClass("close");
    }
  });
});