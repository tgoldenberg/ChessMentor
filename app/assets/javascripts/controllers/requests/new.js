 console.log(window.App);
 window.App.controllers.requests.new = function() {

   var dateChooser = function () {
     var dateTime = " " + $(this).attr('class').match(/sunday|monday|tuesday|wednesday|thursday|friday|saturday/).toString();
     dateTime += " " + $(this).parent('tr').attr('class').match(/morning|afternoon|evening/).toString() + " -";
     var timeField = $('#time-field').val();
     console.log(dateTime);
     if ($(this).hasClass('grey-highlight')) {
       $('#time-field').val(timeField + dateTime);
       console.log($('#time-field').val());
     } else if ($(this).hasClass('green-highlight')) {
       console.log(dateTime);
       timeField = timeField.replace(dateTime, "");
       $('#time-field').val(timeField);
       console.log($('#time-field').val());
     }
     $(this).toggleClass('grey-highlight');
     $(this).toggleClass('green-highlight');
     $(this).find('.glyphicon-ok-circle').toggle();
   };

  //  data: {key:  price:"#{@request.recipient.price*100}",, vendor_id: "#{@request.recipient.id}", description: "#{number_to_currency(@request.recipient.price)}", image: }

   $('.click-date').click(dateChooser);

 }
