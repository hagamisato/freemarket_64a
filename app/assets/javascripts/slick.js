$(function() {
  $('.main__header__box').slick({
      dots: true,
      // autoplay: true,
      // autoplaySpeed: 5000,
      arrows: true,
  });

  $('.main__header__box').slick({
    appendArrows: $('.iconbox')
    });

  $('.iconbox').on('click', function(e) {
    e.preventDefault();
    $('.main__header').slick('goTo', $(this).index());
  });

});