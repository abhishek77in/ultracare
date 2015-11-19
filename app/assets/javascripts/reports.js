$(function(){

  // Switch templates
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

  // Auto save reports
  var typingTimer;                //timer identifier
  var doneTypingInterval = 1000;  //time in ms


  var editor = CKEDITOR.instances["report_content"]

  editor.on( 'key', function( event ) {
    startCountdown();
  });

  $('#report_patient_attributes_name').keyup(function(){
    startCountdown();
  });

  function startCountdown () {
    clearTimeout(typingTimer);
    // if report is valid
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  }

  //user is "finished typing," do something
  function doneTyping () {
    console.log('saving the report.');
    //do something
  }
});
