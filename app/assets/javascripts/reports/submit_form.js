$(function(){
  // save report
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
          $('#report-status').text("Report status: " + report.status);
          $('#report-save-status').text('Saved successfully!');
          $('#report-number').text('Report no. ' + report.id);
        } else {
          $('#report-save-status').text('Not saved yet.');
        }
        isSubmitting = false;
      }
    });
    return false; // prevents normal behaviour
  });
});
