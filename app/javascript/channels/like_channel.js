import consumer from "./consumer"

consumer.subscriptions.create("LikeChannel", {
  connected() {
    console.log("connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#" + data.article_id).html(data.html)
  }
});
