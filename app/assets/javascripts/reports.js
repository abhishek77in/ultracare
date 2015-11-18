$(function(){
  $('select.switch-template').select2({
    allowClear: true,
    placeholder: 'Select a template to switch'
  });

  $('select.switch-template').change(function() {
    var templateId = $(this).val();
    var confimation = confirm('You will loose current work in progress. Press Ok to change the template otherwise press Cancel.');
    if (templateId && confimation) {
      var url = '/templates/' + templateId + '.json';
      $.ajax({
        url: url,
        type: 'get',
        dataType: 'script',
        complete: function(request){
          var template = jQuery.parseJSON(request.responseText);
          CKEDITOR.instances["report_content"].setData(template.content);
          $('h2.report-title').text(template.report_title);
        }
      });
    }
  });
});
