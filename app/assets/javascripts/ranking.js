$(function() {
  $('.ranking__tab__btn').on("click", function(e) {
    e.preventDefault();
    var index = $('.ranking__tab__btn').index(this);
    $('.ranking__tab__btn').removeClass('select');
    $(this).addClass('select');
    $('.ranking__blogs').removeClass('show').eq(index).addClass('show')
  });
});