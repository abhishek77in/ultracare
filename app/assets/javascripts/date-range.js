$(function()
  {
    $('#date-range').dateRangePicker(
      {
      format: 'D-M-YYYY',
      startOfWeek: 'monday',
      autoClose: true,
      shortcuts :
        {
        'prev-days': [3,5,7],
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
