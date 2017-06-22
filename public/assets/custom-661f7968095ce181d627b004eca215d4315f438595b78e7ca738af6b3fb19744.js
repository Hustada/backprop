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
});
