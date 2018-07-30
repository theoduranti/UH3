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
//= require activestorage
//= require turbolinks
//= require_tree .

$('.card').hover(function() {
    var a = Math.random() * 10 - 5;
    $(this).css('transform', 'rotate(' + a + 'deg) scale(1.25)');
  }, function() {
    $(this).css('transform', 'none');
  });



  var number = Math.floor((Math.random() * 5) + 0);
  var number2 = Math.floor((Math.random() * 0) + -5);
  $(".polaroid:nth-of-type(n+1)").css("transform", "rotate(" + number + "deg)");
  $(".polaroid:nth-of-type(n+2)").css("transform", "rotate(" + number2 + "deg)");





  
  function fonctiongrossimoica() {  
    var clickcount = 0 ; 
      if (clickcount == 0) { document.getElementsByClassName('card').className="huger" ; clickcount ++ ; }  
      else { document.getElementsByClassName('card').className="anulhuger" ; clickcount -- ; }  
      end   
  }  