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
  var coinName = document.getElementsByClassName("coinName");
  var coinPrice = document.getElementsByClassName("coinPrice");
  var delta24h = document.getElementsByClassName("changeIn24h");
  var delta7d = document.getElementsByClassName("changeIn7d");
  var deltas = [];
  var singleCoinBox = document.getElementsByClassName('singleCoin');
  var changeBox = document.createElement('div');

  function showActualChange(){
    for(i = 0; i < coinName.length; i++){
      var price = coinPrice[i].innerText;
      var delta24 = delta24h[i].innerText;
      var delta7 = delta7d[i].innerText;
      var actualDelta24h = (price / 100) * delta24;
      var actualDelta7d = (price / 100) * delta7;
      
      var _7DayHolder = document.createElement('p');
      var _1dHolder = document.createElement('p');
      _1dHolder.innerText = 'change of $'+ actualDelta24h + ' in 24 hours';
      _7DayHolder.innerText = 'change of $' + actualDelta7d + ' in 7 days';
      singleCoinBox[i].append(_1dHolder);
      singleCoinBox[i].append(_7DayHolder);
    }
  }

  showActualChange()

  setInterval(function(){
  	var red = Math.ceil(Math.random() * 255);
  	var green = Math.ceil(Math.random() * 255);
  	var blue = Math.ceil(Math.random() * 255);
  	   var title = document.querySelector('h1 a');
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

