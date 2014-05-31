$(function()
  {
    $('#business-analysis-date-range').dateRangePicker(
      {
      format: 'D-M-YYYY',
      startOfWeek: 'monday',
      autoClose: true,
      shortcuts :
        {
        'prev-days': [1,3,7],
        'prev': ['week','month'],
        'next-days':null,
        'next':null
      }
    });

    $('#business-report-date-range').dateRangePicker(
      {
      format: 'D-M-YYYY',
      startOfWeek: 'monday',
      autoClose: true,
      shortcuts :
        {
        'prev-days': [1,3,7],
        'prev': ['week','month'],
        'next-days':null,
        'next':null
      }
    });

    $('#date-range').dateRangePicker(
      {
      format: 'D-M-YYYY',
      startOfWeek: 'monday',
      autoClose: true,
      shortcuts :
        {
        'prev-days': [1,3,7],
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
