$(function() {

  document.addEventListener('turbolinks:load', function(){

    $('.btn-red').click(function() {
      $('.exhibit_modal-wrapper').fadeIn();
    });

  });

});