$(document).foundation({
  accordion: {
    multi_expand: false,
    toggleable: true
  }
});

$(function(){
  $('dl.accordion dd a').click(function(){
    $(this).find('span').toggleClass('fi-arrows-in');
    $(this).find('span').toggleClass('fi-arrows-out');
  });
});
