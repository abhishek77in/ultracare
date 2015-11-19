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
          type: 'GET',
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

  if (editor) {
    editor.on( 'key', function( event ) {
      startCountdown();
    });
    editor.on( 'change', function( event ) {
      startCountdown();
    });
  }

  $('#auto-save-report input, #auto-save-report select')
    .keyup(function(){
      startCountdown();
    })
    .change(function(){
      startCountdown();
    });

  function startCountdown () {
    clearTimeout(typingTimer);
    // if report is valid
    typingTimer = setTimeout(doneTyping, doneTypingInterval);
  }

  function doneTyping () {
    saveReport();
  }

  function saveReport () {
    $('form#auto-save-report').submit();
  }

  $('form#auto-save-report').submit(function() {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: $(this).prop('action'),
      data: valuesToSubmit,
      dataType: "JSON",
      beforeSend: function( xhr ) {
        console.log('saving report.');
      },
      complete: function(request){
        console.log('saved!');
      }
    });
    return false; // prevents normal behaviour
  });
});
