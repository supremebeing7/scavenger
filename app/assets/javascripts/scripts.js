$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/messages', function (data) {
    alert(data);
  })
});
