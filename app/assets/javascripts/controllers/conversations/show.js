window.App.controllers.conversations.show = function() {

  var setScrollHeight = function() {
    $('.current-messages-content').scrollTop($('.current-messages-content').prop('scrollHeight') - 230);
  };

  setScrollHeight();
}
