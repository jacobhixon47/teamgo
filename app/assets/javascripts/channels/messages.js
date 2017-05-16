App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $('.message-form-input').val('');
    return $('#messages-list').append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    var cookie = document.cookie;
    var username = cookie.split("=").pop();
    console.log(username)
    var content;
    if (data.username == username) {
      console.log("if statement executed...")
      content = "<li class='f-row responsive message-row'><div class='f-col-3 current-user-message-col'><h4>" + data.username + " (you)</h4><p>" + data.message + "</p></div></li>";
    } else {
      content = "<li class='f-row responsive message-row'><div class='f-col-3 foreign-user-message-col'><h4>" + data.username + "</h4><p>" + data.message + "</p></div></li>";
    }
    return content;
  }
});
