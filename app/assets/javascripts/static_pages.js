onLoad(function() {
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

// ================================================================================
  $("button.navbar-toggle").click(function () {
    $("#top-menu").toggle();
  });

//   // ================================================================================

  // This is to achieve animated scrolling.
  $(function() {
    $('a[href*=#]:not([href=#myCarousel])').click(function () {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  });

  $(document).on('page:change', function() {
    // This removes the active class from all li elements of a nav
    // element and adds it to the element you click on.
    if ($("#homie").length) {
      $('.nav li a:not(#noquery)').click(function(e) {
          $('.nav li').removeClass('active');
          var $parent = $(this).parent();
          if (!$parent.hasClass('active')) {
              $parent.addClass('active');
          }
          e.preventDefault();
      });
    }

    $('.nav li a.anime').click(function(e) {
        $('.nav li').removeClass('active');
        var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        }
      e.preventDefault();
    });

    $('#exhibit').click(function() {
      $(".ambientacion, .soluciones").hide();
      $(".exhibicion").show();
    });

    $('#ambient').click(function() {
      $('.exhibicion, .soluciones').hide();
      $('.ambientacion').show();
    });

    $('#soluci').click(function() {
      $('.exhibicion, .ambientacion').hide();
      $('.soluciones').show();
    });

  });

});






