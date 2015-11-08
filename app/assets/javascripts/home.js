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

  $('select.template-selector').on("select2-selecting", function(element) {
    var templateId = element.val;
    var url = "/reports/new?template_id=" + templateId;
    window.location = url;
  });
});
