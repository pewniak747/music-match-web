//= require jquery
//= require jquery_ujs
//= require jquery.spin
//= require js_stack
//= require musicmatch
//= require_tree .

Musicmatch.on('start', function() {
  Backbone.history.start();
});
Musicmatch.start();
