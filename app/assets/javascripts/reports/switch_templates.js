$(function(){
  // Switch templates
  $('select.switch-template')
    .select2({
      allowClear: true,
      placeholder: 'Select a template to switch'
    })
    .change(function(event) {
      event.preventDefault();
      var templateId = $(this).val();
      if (templateId) {
        var url = '/templates/' + templateId + '.json';
        $.ajax({
          url: url,
          type: 'GET',
          dataType: 'script',
          complete: function(request){
            var template = jQuery.parseJSON(request.responseText);
            CKEDITOR.instances["report_content"].setData(template.content);
            $('h2.report-title').text(template.report_title);
            $('#report_title').val($('.report-title').text());
          }
        });
      }
    });
});
