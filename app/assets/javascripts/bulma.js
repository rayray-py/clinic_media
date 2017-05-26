jQuery(document).ready(function ($) {
  var $toggle = $('#nav-toggle');
  var $nav_menu = $('#nav-menu');
  var $menu = $('.menu-toggle > li.li-toggle > a');

  $toggle.click(function() {
    $(this).toggleClass('is-active');
    $nav_menu.toggleClass('is-active');
  });

  $('.delete').click(function() {
    $(this).parents('.message-container').remove();
    $(this).parents('.message').remove();
  })

  $menu.click(function() {
    $(this).next().slideToggle();
    $(this).toggleClass('is-active');
  });

  $('.modal-button').click(function() {
    var target = $(this).data('target');
    $('html').addClass('is-clipped');
    $(target).addClass('is-active');
  });

  $('.modal-background, .modal-close').click(function() {
    $('html').removeClass('is-clipped');
    $(this).parent().removeClass('is-active');
  });

  $('.modal-card-head .delete, .modal-card-foot .button').click(function() {
    $('html').removeClass('is-clipped');
    $('.modal-ter').removeClass('is-active');
  });
});
