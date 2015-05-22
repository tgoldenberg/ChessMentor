window.App.controllers.games.show = function() {
  console.log("HI");
  var createTurns = function() {

  }


  var startTimer = function() {
    // set timer
    var addedTimePerMove, formatTime, initialTime, intervalId, pad, remainingTime, switchTurn, turn, update;
    initialTime = 15 * 60;
    addedTimePerMove = 0;
    turn = 1;
    remainingTime = [initialTime, initialTime];
    pad = function(x) {
     return ('0' + x).slice(-2);
    };
    formatTime = function(t) {
     var hours, minutes, seconds;
     seconds = t % 60;
     minutes = Math.floor(t / 60) % 60;
     hours = Math.floor(t / 3600);
     if (hours) {
       return "" + hours + ":" + (pad(minutes)) + ":" + (pad(seconds));
     } else {
       return "" + minutes + ":" + (pad(seconds));
     }
    };
    update = function() {
     var i;
     remainingTime[turn]--;
     for (i = 0; i < 2; i++) {
       $("#time" + i).text(formatTime(remainingTime[i]));
     }
     if (remainingTime[turn] <= 0) {
       $("#time" + turn).removeClass('turn').addClass('loser');
       alert('Game Over');
       return clearInterval(intervalId);
     }
    };
    switchTurn = function() {
       $("#time" + turn).removeClass('turn');
       turn = 1 - turn;
       $("#time" + turn).addClass('turn');
       return remainingTime[turn] += addedTimePerMove;
    };
    $('#time1').addClass('turn');
     return intervalId = setInterval(update, 1000);
  }

  var startChessGame = function() {
    var player1 = $('.games-show-wrapper').data('player1');
    var player2 = $('.games-show-wrapper').data('player2');
    var currentUser = $('.games-show-wrapper').data('currentUser');
    var board,
      game = new Chess(),
      statusEl = $('#status'),
      fenEl = $('#fen'),
      pgnEl = $('#pgn');

    // do not pick up pieces if the game is over
    // only pick up pieces for the side to move
    var onDragStart = function(source, piece, position, orientation) {
      if (game.game_over() === true ||
          (game.turn() === 'w' && currentUser === player2) ||
          (game.turn() === 'b' && currentUser === player1) ||
          (game.turn() === 'w' && piece.search(/^b/) !== -1) ||
          (game.turn() === 'b' && piece.search(/^w/) !== -1)) {
        return false;
      }
    };

    var onDrop = function(source, target) {
      // see if the move is legal
      var move = game.move({
        from: source,
        to: target,
        promotion: 'q' // NOTE: always promote to a queen for example simplicity
      });

      // illegal move
      if (move === null) return 'snapback';
      // var trNum = $('tbody').last().children().length + 1;
      // $('.text-list').append('<tr id="' + trNum + '"><th><b>' + trNum + '</b> <div class="pipe">|</div> ' + move.from + "-" + move.to + '</th></tr>');

      updateStatus(source, target);
    };

    // update the board position after the piece snap
    // for castling, en passant, pawn promotion
    var onSnapEnd = function() {
      board.position(game.fen());
    };

    var updateStatus = function(source, target) {
      var status = '';

      var moveColor = 'White';
      if (game.turn() === 'b') {
        moveColor = 'Black';
      }

      // checkmate?
      if (game.in_checkmate() === true) {
        status = 'Game over, ' + moveColor + ' is in checkmate.';
      }

      // draw?
      else if (game.in_draw() === true) {
        status = 'Game over, drawn position';
      }

      // game still on
      else {
        status = moveColor + ' to move';

        // check?
        if (game.in_check() === true) {
          status += ', ' + moveColor + ' is in check';
        }
      }

      statusEl.html(status);
      fenEl.html(game.fen());
      pgnEl.html(game.pgn());
      $('#move-notation').val(source + '-' + target);
      $('#move-piece').val(game.fen());
      $('#move-user').val(currentUser)
      $('#move-submit').submit();
    };

    var cfg = {
      draggable: true,
      showNotation: false,
      position: 'start',
      snapSpeed: 100,
      snapbackSpeed: 400,
      moveSpeed: 'slow',
      pieceTheme: "/assets/{piece}.png",
      onDragStart: onDragStart,
      onDrop: onDrop,
      onSnapEnd: onSnapEnd
    };
    board = new ChessBoard('board', cfg);
    var currentUser = $('.games-show-wrapper').data('currentuser');
    var player1 = $('.games-show-wrapper').data('player1');
    var player2 = $('.games-show-wrapper').data('player2');

    if (currentUser == player2) {
      board.orientation("black");
      console.log(board.orientation);
    }

    updateStatus();
  };


  startChessGame();
  startTimer();
  createTurns();

}
