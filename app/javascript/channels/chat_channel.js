import consumer from "./consumer"

const appChat = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const ChatMessages = document.getElementById('chat-messages');
    ChatMessages.insertAdjacentHTML('beforeend', data['chat_message']);
  },

  speak: function(chat_message, chat_id) {
    return this.perform('speak', { chat_message: chat_message, chat_id: chat_id });
  }
});


   /*global location*/
if(/chats/.test(location.pathname)) {
  /*global $*/
  $(document).on("keydown", ".chat_message_form", function(e) {
    if (e.key === "Enter") {
      const chat_id = $('textarea').data('chat_id')
      appChat.speak(e.target.value, chat_id);
      e.target.value = '';
      e.preventDefault();
    }
  })
}
