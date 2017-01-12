$(function() {
  function userLIST(name, id) {
      var list =
      '<div class="chat-group-user clearfix">'+
      '<p class="chat-group-user__name">'+
      name+
      '</p>'+
      '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id = '+ id +' data-user-name="' + name + '">'+
      '追加'+
      '</a>' +
      '</div>'
      return list
  };

  $("#user-search-field").on("keyup",function(){
    var preWord;
    var input = $(this).val();

    $.ajax({
      type: 'get',
      url: '/groups/search',
      data: {username: input},
      dataType: 'json'
    })

    .done(function(data) {
      if (input != preWord && input.length !== 0){
        $(".chat-group-user.clearfix").remove();
        $.each(data,function(i,user){
          $('#user-search-result').append(userLIST(user.name, user.id));
        });
      }
      preWord = input
    });
  });

  //追加されるリスト
  function additionalLIST(name, id) {
      var list =
      '<div class="chat-group-users clearfix">'+
      '<input type="hidden" name="group[user_ids][]" value="'+ id +'">' +
      '<p class="chat-group-user__name">'+
      name+
      '</p>'+
      '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id = '+ id +' data-user-name="' + name + '">'+
      '削除'+
      '</a>' +
      '</div>'
      return list
  };

  var btn = '.user-search-add.chat-group-user__btn.chat-group-user__btn--add'

  //追加ボタン機能
  $("#user-search-result").on("click",btn,function(){
    var name = $(this).data("user-name");
    var id = $(this).data("user-id");
    $(this).parent().remove();
    $('#chat-group-users').append(additionalLIST(name, id));
  });

  //削除ボタン機能
  $("#chat-group-users").on("click",btn,function(){
    var name = $(this).data("user-name");
    var id = $(this).data("user-id");
    $(this).parent().remove();
    $('#user-search-result').append(userLIST(name, id));
  });
});
