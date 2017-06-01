$(function() {
  $('.icon-user-actions').hover(
    function () {
      // show
      $('.user-nav-items').addClass('show-user-nav');
    },
    function () {
      $('.user-nav-items').removeClass('show-user-nav');
    }
  );

});
