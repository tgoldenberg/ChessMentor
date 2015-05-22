
window.App.controllers.pages.home = function() {
  if ( <%= user_signed_in? %>) {



  var setBoard = function() {
    if ($('#board').length && $('#board2').length && $('#board3').length) {
      var cfg = {
        pieceTheme: '/assets/{piece}.png',
        showNotation: false,
        position: 'start'
      };
      cfg.position = 'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R'
      var board = new ChessBoard('board', cfg);
      cfg.position = 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR'
      var board2 = new ChessBoard('board2', cfg);
      cfg.position = 'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R';
      var board3 = new ChessBoard('board3', cfg);
    }
  };

  var dropdownShow = function() {
    $(".dropdown-menu").toggleClass("show-menu");
    $(".dropdown-menu > li").click(function(){
      $(".dropdown-menu").removeClass("show-menu");
    });
    $(".dropdown-menu.dropdown-select > li").click(function() {
      $(".dropdown-button").html($(this).html());
    });
  };

  setBoard();
  $('.dropdown-button').click(dropdownShow);
  }
}
