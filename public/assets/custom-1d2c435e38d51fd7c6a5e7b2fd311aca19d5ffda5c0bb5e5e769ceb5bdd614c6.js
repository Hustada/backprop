$(document).ready(function() {
	$('#flash-message').delay(1000).fadeIn('slow').delay(1000).fadeOut('slow');
  // $('#js--main-nav').addClass('js--main-nav-delay');

  // setTimeout(function () { 
  //     $('#js--main-nav').removeClass('js--main-nav-delay');
  // }, 3000);


    function collapseNavbar() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
}

    $(window).scroll(collapseNavbar);
    $(document).ready(collapseNavbar);

    $(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500 );
        event.preventDefault();
    });
  });

  $window = $(window);
 
   $('section[data-type="background"]').each(function(){
     // declare the variable to affect the defined data-type
     var $scroll = $(this);
                     
      $(window).scroll(function() {
        // HTML5 proves useful for helping with creating JS functions!
        // also, negative value because we're scrolling upwards                             
        var yPos = -($window.scrollTop() / $scroll.data('speed')); 
         
        // background position
        var coords = '50% '+ yPos + 'px';
 
        // move the background
        $scroll.css({ backgroundPosition: coords });    
      }); // end window scroll
   });  // end section function
});
