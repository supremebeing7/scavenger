$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  alert('subscribing...');
  faye.subscribe('/messages', function (data) {
    eval(data);
  })
});
