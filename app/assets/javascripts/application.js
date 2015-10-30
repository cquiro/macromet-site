// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$( document ).ready(function() {
  // This slides a color square with the description of every team member
  // over its picture when on hover.
  $('.team-member').hover(
    function(){
      $(this).find('.team-description').slideDown(250); //.fadeIn(250)
    },
    function(){
      $(this).find('.team-description').slideUp(250); //.fadeOut(205)
    }
  );

  // This is to achieve animated scrolling.
  $(function() {
    $('a[href*=#]:not([href=#myCarousel])').click(function () {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  });

  // This removes the active class from all li elements of a nav
  // element and adds it to the element you click on.
  $('.nav li a').click(function(e) {
    $('.nav li').removeClass('active');
    var $parent = $(this).parent();
    if (!$parent.hasClass('active')) {
        $parent.addClass('active');
    }
    e.preventDefault();
  });


  $("#exhibit").click(function() {
    $("#porta-am, #porta-so").hide();
    $("#porta-ex").show();
  });

  $("#ambient").click(function() {
    $("#porta-ex, #porta-so").hide();
    $("#porta-am").show();
  });

  $("#soluci").click(function() {
    $("#porta-ex, #porta-am").hide();
    $("#porta-so").show();
  });
});
