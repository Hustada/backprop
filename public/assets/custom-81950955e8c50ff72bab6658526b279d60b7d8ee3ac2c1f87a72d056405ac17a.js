$(document).ready(function() {
	$('.flash-message').delay(3000).slideDown('slow').delay(500).slideUp('slow');

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
});
