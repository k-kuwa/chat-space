$(function() {
  function updateHTML(name, time, text, image) {
    if(image.image.url != null){
      var imageSpace = '<br>'+'<img src="' + image.image.url + '">'
    }else{
      var imageSpace = ''
    }
    var html =
    '<li class="chat__main__center__message__name">'+
    '<div class="chat__main__center__message__header">'+
    '<p class="chat__main__center__message__header__name">'+
    name +
    '</p>' +
    '<p class="chat__main__center__message__header__time">'+
    time +
    '</p>' +
    '</div>' +
    '<p class="chat__main__center__message__text">'+
    text +
    imageSpace +
    '</p>' +
    '</li>'
    return html
  };

setInterval(function(){
    $.ajax({
      type: 'get',
      url: window.location.href,
      dataType: 'json'
    })
    .done(function(data){
      $('.chat__main__center__message__name').remove();
      $.each(data.database,function(i,message){
       $('.chat__main__center__message').append(updateHTML(message.name, message.time, message.text, message.image));
      });
    })
    },10*1000);
});
