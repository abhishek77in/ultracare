$(function(){
  $('select.switch-template')
    .select2({
      allowClear: true,
      placeholder: 'Select a template to switch'
    })
    .change(function() {
      var templateId = $(this).val();
      var confirmation = confirm('Warning: You will loose current work progress. Press Ok to continue with change of template otherwise press Cancel.');
      if (templateId && confirmation) {
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
