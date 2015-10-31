$(function(){
  function setDefaultSection(element) {
    var section = element.data('section');
    var defaultSetting = element.data('default-setting');
    CKEDITOR.instances[section].setData(defaultSetting);
  }

  function setDefaultMargin(element) {
    var marginArea = element.data('margin-area');
    var defaultMargin = element.data('default-margin');
    $('#' + marginArea).val(defaultMargin);
  }

  $('.reset-to-default').click(function(e){
    e.preventDefault();
    setDefaultSection($(this));
    setDefaultMargin($(this));
  });
});
