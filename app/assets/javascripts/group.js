$(function() {
  function buildUSER(name) {
      var userList =
      '<div class="chat-group-user clearfix">'+
      '<p class="chat-group-user__name">'+
      name+
      '</p>'+
      '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add">'+
      '追加'+
      '</a>' +
      '</div>'
      return userList
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
          $('#user-search-result').append(buildUSER(user.name));
        });
      }
      preWord = input
    });
  });
});
