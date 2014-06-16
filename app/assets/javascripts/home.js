$(function(){
  $('.printLink').click(function (e) {
    e.preventDefault();
    var id = $(this).data('report-id');
    var w = window.open("/reports/" + id + "/print");
    w.print();
  });
});
