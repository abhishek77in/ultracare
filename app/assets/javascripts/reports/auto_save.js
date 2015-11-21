$(function(){
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

  // copy report title
  $('.report-title').keyup(function(){
    $('#report_title').val($(this).text());
  });
});
