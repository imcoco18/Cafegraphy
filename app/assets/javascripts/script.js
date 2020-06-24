//page-top
$(function() {
  var pagetop = $('#back a');
  // ボタン非表示
  pagetop.hide();

  // 100px スクロールしたらボタン表示
  $(window).scroll(function () {
     if ($(this).scrollTop() > 700) {
          pagetop.fadeIn();
     } else {
          pagetop.fadeOut();
     }
  });
  pagetop.click(function () {
     $('body, html').animate({ scrollTop: 0 }, 500);
     return false;
  });
});
//   $('#back a').on('click',function(){
//     $('body, html').animate({
//       scrollTop:0
//     }, 800);
//       return false;
//   });

// });
//hamburger
$(function() {
 
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
 
 });