document.addEventListener("turbolinks:load", function() {
    jQuery(function() {
    if ($('#infinite-scrolling').size() > 0) {
      return $(window).on('scroll', function() {
        var more_posts_url; // <- /events?page=2
        more_posts_url = $('.pagination .next_page a').attr('href');
        if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 250) {
          $('.pagination').html('<img src="../assets/images/cool-loading.gif" alt="Loading..." title="Loading..." />');
          $.getScript(more_posts_url);
        }
        return;
      });
    }
  });
})
