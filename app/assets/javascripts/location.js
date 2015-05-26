$(function() {
  loc = $('body').attr('class');
  console.log(loc);
  switch(loc) {
    case "requests_new" :
      App.controllers.requests.new();
      break;
    case "pages_home" :
      App.controllers.pages.home();
      break;
    case "registrations_new" :
      App.controllers.registrations.new();
      break;
    case "sessions_new" :
      App.controllers.sessions.new();
      break;
  }
});
