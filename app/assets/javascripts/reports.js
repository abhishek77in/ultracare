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

  $('#auto-save-report input, #auto-save-report select, .report-title')
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

  var isSubmitting = false;

  $('form#auto-save-report').submit(function() {
    if(isSubmitting) {
      return;
    }
    isSubmitting = true;
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: $(this).prop('action'),
      data: valuesToSubmit,
      dataType: "JSON",
      beforeSend: function( xhr ) {
        $('#report-save-status').text('Saving...');
      },
      complete: function(request){
        var report = jQuery.parseJSON(request.responseText);
        if(report.id) {
          $('#report_id').val(report.id);
          $('#report-status').val(report.status);
          $('#report-save-status').text('Saved successfully!');
          $('#report-number').text('Report no.' + report.id);
        } else {
          $('#report-save-status').text('Not saved yet.');
        }
        isSubmitting = false;
      }
    });
    return false; // prevents normal behaviour
  });

  // copy report title
  $('.report-title').keyup(function(){
    $('#report_title').val($(this).text());
  });
});
