$(function() {

  console.log("HELLO");

  if ($('#board').length && $('#board2').length && $('#board3').length) {

    var cfg = {
      pieceTheme: '/assets/{piece}.png',
      showNotation: false,
      position: 'start'
    };
    console.log(cfg);
    cfg.position = 'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R'
    var board = new ChessBoard('board', cfg);
    cfg.position = 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR'
    var board2 = new ChessBoard('board2', cfg);
    cfg.position = 'r1bqkbnr/pppp1ppp/2n5/1B2p3/4P3/5N2/PPPP1PPP/RNBQK2R';
    var board3 = new ChessBoard('board3', cfg);
  }

});
