// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets


// post new
$(document).on('turbolinks:load', function() {
    // 画像をアップしたら表示する
    // jQuery Upload Thumbs
    $('form input:file').uploadThumbs();

    // サクセスメッセージを秒数で消す
    //setTimeout("$('#flash').fadeOut('slow')", 2000);
});

//comment validates
$(document).on('turbolinks:load', function() {
  if ( $("textarea").val().length == 0 ) {
    $('#submit').prop('disabled', true);
  }
  $("textarea").bind('keydown keyup keypress change', function() {
    if ( $(this).val().length > 0 ) {
      $('#submit').prop('disabled', false);
    } else {
      $('#submit').prop('disabled', true);
    }
  });
});

//DM validates
$(document).on('turbolinks:load', function() {
  if ( $('#textarea').val().length == 0 ) {
    $('#submit').attr('disabled', 'disabled');
  }
  $('#textarea').bind('keydown keyup keypress change', function() {
    if ( $(this).val().length > 0 ) {
      $('#submit').removeAttr('disabled');
    } else {
      $('#submit').attr('disabled', 'disabled');
    }
  });
});


//お問い合わせ validates
$(document).on('turbolinks:load', function() {
  if ( $('#textfield', '#textarea').val().length == 0 ) {
    $('#submit').attr('disabled', 'disabled');
  }
  $('#textfield', '#textarea').bind('keydown keyup keypress change', function() {
    if ( $(this).val().length > 0 ) {
      $('#submit').removeAttr('disabled');
    } else {
      $('#submit').attr('disabled', 'disabled');
    }
  });
});

$(document).on('turbolinks:load', function() {
  $('.icon-hover').hover(
    function() {
      $(this).find('.user_edit_link_tag').addClass('user_edit_link_tag_active');
    },
    function() {
      $(this).find('.user_edit_link_tag').removeClass('user_edit_link_tag_active');
  });
});

