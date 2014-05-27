$(function()
  {
    $('#print_business_report').click(function(){
      if ($('#date-range').val().length > 0) {
      } else {
        alert('Please set Date Range to print business report.');
        return false;
      }
    });

    $('#date-range').dateRangePicker(
      {
      format: 'D-M-YYYY',
      startOfWeek: 'monday',
      autoClose: true,
      shortcuts :
        {
        'prev-days': [1,3,5,7],
        'prev': ['week','month','year'],
        'next-days':null,
        'next':null
      }
    });

    // language:'en'
    // autoClose: true
    // startOfWeek: 'monday'
    // format: 'dddd MMM Do, YYYY'  //more formats at http://momentjs.com/docs/#/displaying/format/
    // separator : ' ~ '
    //  singleDate : true
  });
