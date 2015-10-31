$(function(){
  function setDefaultSection(element) {
    var section = element.data('section');
    var defaultSetting = element.data('default-setting');
    CKEDITOR.instances[section].setData(defaultSetting);
  }

  function setDefaultMargin() {

  }

  $('.reset-to-default').click(function(e){
    e.preventDefault();
    //var section = $(this).data('section');
    //var defaultSetting = $(this).data('default-setting');
    setDefaultSection($(this));
    //setDefaultMargin();
  });
});
