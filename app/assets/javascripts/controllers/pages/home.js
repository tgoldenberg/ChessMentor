
window.App.controllers.pages.home = function() {

  var openGame = function() {
    gameId = $(this).data('game-id');
    if (gameId != undefined) {
      window.location = "/games/" + gameId;
    }
  };

  var pulseMessages = function() {
    numMessages = $('.navigation-wrapper').data('messages');
    numRequests = $('.navigation-wrapper').data('requests');
    console.log(numMessages, numRequests);
    if (numMessages !== 0) {
      $('.glyphicon-envelope').addClass('color-change');
    } else if (numMessages === 0) {
      $('.glyphicon-envelope').removeClass('color-change');
    }
    if (numRequests !== 0) {
      $('.glyphicon-globe').addClass('color-change');
    } else if (numRequests === 0) {
      $('.glyphicon-globe').removeClass('color-change');
    }
  }

  var openAccountInfo = function() {
    currentUser = $('.top-content-wrapper').data('user');
    $.ajax({
      type: 'GET',
      url: '/users/edit'
    });
  };

  var dropdownShow = function() {
    $(".mentor-search-menu").toggleClass("show-menu");
    $(".dropdown-menu > li").click(function(){
      $(".mentor-search-menu").removeClass("show-menu");
    });
    $(".mentor-search-menu.dropdown-select > li").click(function() {
      $(".mentor-search-button").html($(this).html());
    });
  };

  pulseMessages();
  $('.mentor-search-button').click(dropdownShow);
  $('.board').on('click', openGame);
  $('.edit-profile-link').on('click', openAccountInfo);

}
