$(function() {
  function buildHTML(message) {
    var html =
    '<li class="chat__main__center__message__name">'+
    '<div class="chat__main__center__message__header">'+
    '<p class="chat__main__center__message__header__name">'+
    message.name +
    '</p>'+
    '<p class="chat__main__center__message__header__time">'+
    message.time +
    '</p>' +
    '</div>' +
    '<p class="chat__main__center__message__text">'+
    message.text +
    '</p>'
    '</li>'
    return html
  };

  $('#message_submit').on('click', function(e) {
    e.preventDefault();
    var formdata = new FormData($('.chat__main__footer__newmessage').get(0));
    $.ajax({
      type: 'POST',
      url: window.location.href + '.json',
      data: formdata,
      processData : false,
      contentType : false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat__main__center__message').append(html);
      $('.message__text').val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
