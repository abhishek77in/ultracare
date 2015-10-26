$(function(){
  function setDefault(section, value) {
    CKEDITOR.instances[section].setData(value);
    // CKEDITOR.instances['setting_footer'].setData("hello world");
  }

  $('.reset-to-default').click(function(e){
    e.preventDefault();
    var section = $(this).data('section');
    var value = $(this).data('default-setting');
    setDefault(section, value);
  });
});
