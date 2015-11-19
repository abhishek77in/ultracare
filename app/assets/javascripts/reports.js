$(function(){
  $('select.switch-template')
    .select2({
      allowClear: true,
      placeholder: 'Select a template to switch'
    })
    .change(function() {
      var templateId = $(this).val();
      if (templateId) {
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
