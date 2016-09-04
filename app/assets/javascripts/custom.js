$(document).ready(function() {
     
    /* For the sticky navigation  something here*/
    $('.js--section_1').waypoint(function(direction) {
        if (direction == "down") {
            $('nav').addClass('sticky');
        } else {
            $('nav').removeClass('sticky');
        }
    }, {
      offset: '60px;'
    });
    
    /* Navigation scroll */
    $(function() {
      $('a[href*=\\#]:not([href=\\#])').click(function() {
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


    $('#js--scroll-to-title').click(function () {
       $('html, body').animate({scrollTop: $('.js--article-title').offset().top}, 1000); 
    });


    $('.js--arrow').click(function () {
       $('html, body').animate({scrollTop: $('.js--section_1').offset().top}, 1000); 
    });

   
/* Mobile navigation */


    /* slide reveal */

    $('.flash-message').delay(3000).slideDown('slow').delay(500).slideUp('slow');
    
});