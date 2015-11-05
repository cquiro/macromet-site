// $(document).ready(function() {
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

// // ================================================================================
//   // Cache selectors
//   var lastId,
//       topMenu = $("#top-menu"),
//       topMenuHeight = topMenu.outerHeight()+15,
//       // All list items
//       menuItems = topMenu.find("a"),
//       // Anchors corresponding to menu items
//       scrollItems = menuItems.map(function(){
//         var item = $($(this).attr("href"));
//         if (item.length) { return item; }
//       });
//
//   // Bind click handler to menu items
//   // so we can get a fancy scroll animation
//   menuItems.click(function(e){
//     var href = $(this).attr("href"),
//         offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
//     $('html, body').stop().animate({
//         scrollTop: offsetTop
//     }, 300);
//     e.preventDefault();
//   });
//
//   // Bind to scroll
//   $(window).scroll(function(){
//      // Get container scroll position
//      var fromTop = $(this).scrollTop()+topMenuHeight;
//
//      // Get id of current scroll item
//      var cur = scrollItems.map(function(){
//        if ($(this).offset().top < fromTop)
//          return this;
//      });
//      // Get the id of the current element
//      cur = cur[cur.length-1];
//      var id = cur && cur.length ? cur[0].id : "";
//
//      if (lastId !== id) {
//          lastId = id;
//          // Set/remove active class
//          menuItems
//            .parent().removeClass("active")
//            .end().filter("[href=#"+id+"]").parent().addClass("active");
//      }
//   });
//
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

  // // This removes the active class from all li elements of a nav
  // // element and adds it to the element you click on.
  // $('.nav li a').click(function(e) {
  //   $('.nav li').removeClass('active');
  //   var $parent = $(this).parent();
  //   if (!$parent.hasClass('active')) {
  //       $parent.addClass('active');
  //   }
  //   e.preventDefault();
  // });

  // $("#exhibit").click(function() {
  //   $("#porta-am, #porta-so").hide();
  //   $("#porta-ex").show();
  // });
  //
  // $("#ambient").click(function() {
  //   $("#porta-ex, #porta-so").hide();
  //   $("#porta-am").show();
  // });
  //
  // $("#soluci").click(function() {
  //   $("#porta-ex, #porta-am").hide();
  //   $("#porta-so").show();
  // });

});

// $(document).ready(function() {
  $(document).on('page:change', function() {
    // This removes the active class from all li elements of a nav
    // element and adds it to the element you click on.
  if ($("#homie").length) {
    $('.nav li a').click(function(e) {
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
    $("#porta-am, #porta-so").hide();
    $("#porta-ex").show();
  });

  $('#ambient').click(function() {
    $('#porta-ex, #porta-so').hide();
    $('#porta-am').show();
  });

  $('#soluci').click(function() {
    $('#porta-ex, #porta-am').hide();
    $('#porta-so').show();
  });
});



// // Cache selectors
// var lastId,
//     topMenu = $("#top-menu"),
//     topMenuHeight = topMenu.outerHeight()+15,
//     // All list items
//     menuItems = topMenu.find("a"),
//     // Anchors corresponding to menu items
//     scrollItems = menuItems.map(function(){
//       var item = $($(this).attr("href"));
//       if (item.length) { return item; }
//     });
//
// // Bind click handler to menu items
// // so we can get a fancy scroll animation
// menuItems.click(function(e){
//   var href = $(this).attr("href"),
//       offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
//   $('html, body').stop().animate({
//       scrollTop: offsetTop
//   }, 300);
//   e.preventDefault();
// });
//
// // Bind to scroll
// $(window).scroll(function(){
//    // Get container scroll position
//    var fromTop = $(this).scrollTop()+topMenuHeight;
//
//    // Get id of current scroll item
//    var cur = scrollItems.map(function(){
//      if ($(this).offset().top < fromTop)
//        return this;
//    });
//    // Get the id of the current element
//    cur = cur[cur.length-1];
//    var id = cur && cur.length ? cur[0].id : "";
//
//    if (lastId !== id) {
//        lastId = id;
//        // Set/remove active class
//        menuItems
//          .parent().removeClass("active")
//          .end().filter("[href=#"+id+"]").parent().addClass("active");
//    }
// });
