function uploadImage() {
    $('.card-image').hover(function () {
        $(this).find('a').css('display', 'block')
    }, function () {
        $(this).find('a').css('display', 'none')
    })
}

$(document).ready(function () {
    uploadImage()
})

$(document).on('turbolinks:load', function () {
    $(window).on('scroll', function () {
        more_posts_url = $('.pagination .next a').attr('href');
        if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
            $('.pagination').html(`  <div class="progress">
                                      <div class="indeterminate"></div>
                                  </div>`);
            $.getScript(more_posts_url);
        }
    });
});