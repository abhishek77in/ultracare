$(function(){
  // Append template
  $('select.append-template')
    .select2({
      allowClear: true,
      placeholder: 'Select a template to append'
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
            CKEDITOR.instances["report_content"].insertHtml(template.content);
          }
        });
      }
    });
});
