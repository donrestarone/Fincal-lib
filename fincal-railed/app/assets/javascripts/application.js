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
//= require turbolinks
//= require_tree .


document.addEventListener('DOMContentLoaded', function(e){
  // CODE GOES HERE
  // setInterval(function(){
  // 	var colors = ['red', 'blue', 'green', 'yellow', 'purple', 'orange'];
  // 	  var title = document.querySelector("#page-title");
  // 	  title.style.color = colors[Math.floor(Math.random()*colors.length)];
  // }, 35)

  

  setInterval(function(){
  	red = Math.ceil(Math.random() * 255);
  	green = Math.ceil(Math.random() * 255);
  	blue = Math.ceil(Math.random() * 255);
  	  var title = document.querySelector('h1 a');
  	  title.style.color = "rgb(" + red + "," + green + "," + blue + ")";
  }, 200)

})