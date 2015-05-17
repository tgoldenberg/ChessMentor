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

   var ajaxCharge = function(event) {
     event.preventDefault();
     $.ajax({
       type: "POST",
       url: $(this).attr('action'),
       data: $(this).serialize(),
       dataType: "JSON"
     });
   };

   var ajaxStripe = function(event) {
     event.preventDefault();
    //  $.ajax({
    //    type: 'POST',
    //    url: $(this).attr('action'),
    //    data: $(this).serialize(),
    //    dataType: 'JSON'
    //  });
    console.log("This is a test");
    return false;
   };

   var handler = StripeCheckout.configure({
    key: window.stripeKey,
    image: "/assets/landing_background.png",


    token: function(token) {
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`
      console.log(token);
    }
  });

  $('.stripe-button').on('click', function(e) {
    // Open Checkout with further options
    e.preventDefault();
    console.log(window.stripeKey, handler);
    // handler.open({
    //   name: 'Localhost:3000',
    //   description: '2 widgets',
    //   amount: 2000
    // });
    return false;
  });

  // Close Checkout on page navigation
  $(window).on('popstate', function() {
    handler.close();
  });

  //  data: {key:  price:"#{@request.recipient.price*100}",, vendor_id: "#{@request.recipient.id}", description: "#{number_to_currency(@request.recipient.price)}", image: }

   $('.click-date').click(dateChooser);
   $('#new_charge').submit(ajaxStripe);

 }
