$(function() {
  document.addEventListener('turbolinks:load', function(){
    $('.main__header__box').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 5000,
        arrows: true,
    });

    $('.iconbox').on('click', function(e) {
      e.preventDefault();
      $('.main__header').slick('goTo', $(this).index());
    });

  });

});