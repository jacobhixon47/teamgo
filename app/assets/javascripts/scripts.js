$(document).on("turbolinks:load", function() {
  // Nav class changes
  $('.sessions.new nav').removeClass('nav-ghost-pop').addClass('nav-ghost-light');
  // Scroll Animations - ScrollTo
  $("#learn-more-button-home").click(function() {
    $('#signup-form').show();
    $('#home-slideshow').show();
    $('html, body').animate({
        scrollTop: $("#home-slideshow").offset().top
    }, 1000);
  });
  $("#get-started-button-home").click(function() {
    $('#home-slideshow').show();
    $('#signup-form').show();
    $('html, body').animate({
        scrollTop: $("#signup-form").offset().top
    }, 1000);
  });
  $(".back-to-top").click(function() {
    $('html, body').animate({
        scrollTop: 0
    }, 1000);
  });
  $(".slideshow-signup").click(function() {
    $('html, body').animate({
        scrollTop: $("#signup-form").offset().top
    }, 1000);
  });

// Scroll Animations - Fade Buttons In/Out
  var nav = $('.my-nav');
  if ( $('body').hasClass('home') ) {
  	$(window).scroll(function() {
  		var scroll = $(window).scrollTop();
  		if (scroll >= 300 && !nav.hasClass('nav-light') && !nav.hasClass('nav-pop')) {
  			nav.slideUp(1, function() {
  // if view is teams/channels/messages controlled
          if ($('body').hasClass('teams') || $('body').hasClass('channels') || $('body').hasClass('messages')) {
            nav.removeClass('nav-ghost-pop').addClass('nav-pop').fadeIn(500);
          } else {
            nav.removeClass('nav-ghost-pop').addClass('nav-light').fadeIn(500);
          }
          $('.back-to-top').fadeIn(500);
        });
  		} else if (scroll <= 150 && !nav.hasClass('nav-ghost-pop')) {
        nav.slideUp(1, function() {
  // if view is teams/channels/messages controlled
          if ($('body').hasClass('teams') || $('body').hasClass('channels') || $('body').hasClass('messages')) {
            nav.removeClass('nav-pop').addClass('nav-ghost-pop').fadeIn(500);
          } else {
            nav.removeClass('nav-light').addClass('nav-ghost-pop').fadeIn(500);
          }
          $('.back-to-top').fadeOut(500);
        });
  		} else if (scroll >= 300 && scroll <= $("#signup-form").offset().top && $(".slideshow-signup").css('display') === 'none') {
        $('.slideshow-signup').fadeIn(500);
      } else if (scroll <= 150  || scroll >= $("#signup-form").offset().top && $(".slideshow-signup").css('display') !== 'none') {
        $(".slideshow-signup").fadeOut(500);
      }
    });
  }

  // hide sidebar unless on certain pages
  if ($('body').hasClass('teams') || $('body').hasClass('channels') || $('body').hasClass('messages')) {
    $('#my-team-sidebar').show();
  } else if (!$('body').hasClass('teams')) {
    $('#my-team-sidebar').hide();
  }

  // radio button show/hide form
  $("input:radio[name='channel[public]']").change(function() {
    console.log("private");
    var selected = $('input:checked[name="channel[public]"]').val();
    if (selected == "false" ) {
      $("#new_channel .members-select").show();
    } else if ( selected == "true" ) {
      $("#new_channel .members-select").hide();
    }
  });
});
