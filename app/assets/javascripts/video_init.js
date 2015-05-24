var videoConference = function(loser) {
  var winner = "";
  if (loser === 'b') {
    winner = 'White';
  } else if (loser === 'w') {
    winner = 'Black';
  } else {
    winner = "a Tie";
  }

  $('.game-over').toggle().delay(2000).queue(function(next) {
    $('.captured-pieces').addClass('bounceOutDown');
    $('.board-wrapper').delay(700).animate({
      "margin-left":"180px"
    }, 'easeOutBounce');
    $('.board-wrapper').promise().done(function() {
      $(this).css({
        'position': 'absolute',
        'right': '282px'
      });
      $('.user-profiles').animate({
        'margin-left':'180px'
      }, 'easeOutBounce', function() {
        $('#player2-profile').delay(4000).addClass('bounceOutDown');
        $('#player1-profile').animate({
          'margin-top': '411px',
          'height': '130px',
          'margin-left':'56px',
          'width':'170px'
        });
        $('.player-header').find('p').html("Conference");
        $('#player1-profile').find('.player-content').hide();
        $('.video-box').fadeIn('slow');
        $('.video-box-self').fadeIn('slow');
        $('.video-box-self').promise().done(function() {
          $('.game-over').removeClass('bounceIn').addClass('bounceOut');
          var PUBLIC_KEY = '2680b2a108dc3c685fdd05cf24651182';
          var ROOM_NAME = 'example';

          CineIOPeer.init(PUBLIC_KEY);
          CineIOPeer.join(ROOM_NAME);
          CineIOPeer.startCamera();
          CineIOPeer.on('media-rejected', function(data) {
            alert('Media rejected.');
          });
          CineIOPeer.on('media-added', function(data) {
            var videoDOMNode = data.videoElement, domId;
            if (data.local) {
              domId = 'myVideo';
            } else {
              domId = 'otherVideos';
            }
            $('#' + domId).find('video').hide();
            document.getElementById(domId).appendChild(videoDOMNode);
            $('#myVideo').find('video').css('width', '190px');
            $('#otherVideos').find('video').css({'width':'400px', 'height':'331px'});
          });

          $('#camera').click(function() {
            if (CineIOPeer.cameraRunning()) {
              CineIOPeer.stopCamera();
            } else {
              CineIOPeer.startCamera();
            }
          });
        });
      });

    });

    // $('#camera').click(function() {
    //   if (CineIOPeer.cameraRunning()) {
    //     CineIOPeer.stopCamera();
    //   } else {
    //     CineIOPeer.startCamera();
    //   }
    // });
    // CineIOPeer.on('error', function(err) {
    //   if (typeof(err.support) != 'undefined' && !err.support) {
    //     alert('This browser does not support WebRTC.');
    //   } else if (err.msg) {
    //     alert(err.msg);
    //   }
    // });

  });
};
