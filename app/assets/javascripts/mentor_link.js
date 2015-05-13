$(function() {
  var carousel = function() {
    var one = $('.item').first();
    var two = $('.item').first().next();
    var three = $('.item').last();
    if (one.css('visibility') === 'visible') {
      one.animate({'visibility':'hidden'});
      two.animate({'visibility':'visible'});
    } else if (two.css('visibility') === 'visible') {
      two.animate({'visibility':'hidden'});
      three.animate({'visibility':'visible'});
    } else {
      three.animate({'visibility':'hidden'});
      one.animate({'visibility':'visible'});
    }
  }
  setInterval(carousel, 2000);

});
