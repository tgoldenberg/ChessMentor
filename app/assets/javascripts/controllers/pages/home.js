
window.App.controllers.pages.home = function() {

  var openGame = function() {
    gameId = $(this).data('game-id');
    if (gameId != undefined) {
      window.location = "/games/" + gameId;
    }
  }

  var dropdownShow = function() {
    $(".dropdown-menu").toggleClass("show-menu");
    $(".dropdown-menu > li").click(function(){
      $(".dropdown-menu").removeClass("show-menu");
    });
    $(".dropdown-menu.dropdown-select > li").click(function() {
      $(".dropdown-button").html($(this).html());
    });
  };

  $('.dropdown-button').click(dropdownShow);
  $('.board').on('click', openGame);

}
