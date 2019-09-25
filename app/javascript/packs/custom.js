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