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
  setInterval(function(){
  	red = Math.ceil(Math.random() * 255);
  	green = Math.ceil(Math.random() * 255);
  	blue = Math.ceil(Math.random() * 255);
  	  var title = document.querySelector('h1 a');
  	  title.style.color = "rgb(" + red + "," + green + "," + blue + ")";
  }, 75)

  setInterval(function(){
		var yourFincal = document.querySelector('.fincalwelcome')
		var options = ['Your Personal Financial Planner', 'Your Personal Database', 'Your Personal Cashflow Manager']
  		
		// options.forEach(function(element) {
		// 	yourFincal.innerText = element
		// })

		

  	  	// for (var i = 0; i < 10000 ; i++) {
  	  	// 	yourFincal.innerText = options[i]
  	  	// }
  }, 500)


})

