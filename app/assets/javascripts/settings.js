$(function(){
  function setDefault(section, value) {
    CKEDITOR.instances[section].setData(value);
    // CKEDITOR.instances['setting_footer'].setData("hello world");
  }
});
