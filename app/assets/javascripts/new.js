$(function() {

  document.addEventListener('turbolinks:load', function(){

      $('.input-price').keyup(function() {
      var price = $('.input-price').val();
      var price_fee = (price * 0.1);
      var price_profit = (price - price_fee);
      $('#fee').text(price_fee);
      $('#amount').text(price_profit);
    });

  });

});