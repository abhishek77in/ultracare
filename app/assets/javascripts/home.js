$(function(){

  var isChromium = window.chrome,
    vendorName = window.navigator.vendor;
  if(isChromium !== null && vendorName === "Google Inc.") {
    isChrome = true;
  } else {
    isChrome = false;
  }

  $('.printLink').click(function (e) {
    e.preventDefault();
    var id = $(this).data('report-id');
    var w = window.open("/reports/" + id + "/print");
    if(isChrome) { w.print(); }
  });

  $('select.template-selector').select2({
    allowClear: true,
    placeholder: 'Select a template to start creating new report'
  });

  $('select.template-selector').change(function() {
    var templateId = $(this).val();
    if (templateId) {
      var url = "/reports/new?template_id=" + templateId;
      window.location = url;
    }
  });


  $('#templates').sortable({
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.ajax({
        url: '/templates/sort',
        type: 'patch',
        data: $('#templates').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#templates').effect('highlight');
        }
      });
    }
  });
});
