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
   var title = document.querySelector('h1 a');
  setInterval(function(){
  	var red = Math.ceil(Math.random() * 255);
  	var green = Math.ceil(Math.random() * 255);
  	var blue = Math.ceil(Math.random() * 255);
  	 
  	  title.style.color = "rgb(" + red + "," + green + "," + blue + ")";
  }, 75)

  setInterval(function(){
		var yourFincal = document.querySelector('.fincalwelcome')
		var options = ['Your Personal Financial Planner', 'Your Personal Accounts Database', 'Your Personal Cashflow Manager']
  	var selection = Math.floor(Math.random() * options.length);

    if(selection != NaN && selection <= options.length && selection != undefined){  
      var lastSelection = options[selection]
      yourFincal.innerText = options[selection];

    }
  }, 900)


})

