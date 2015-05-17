$(function() {
  console.log(window.App);
  loc = $('body').attr('class');
  switch(loc) {
    case "requests_new" :
      App.controllers.requests.new();
      break;
    case "pages_new" :
      App.controllers.pages.home();
      break;
  }
});
