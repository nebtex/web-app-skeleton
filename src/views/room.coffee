mercury = require("mercury")
h = mercury.h

class MessagesContainerView

  constructor:(messages)->
    @messages = messages

  render_message:(message)->

    message_params =
      author:message.author.username,
      time:message.time,
      avatar:message.author.avatar
      content:message.content
      author_last_logging: message.author.last_logging

    h "message", message_params

  render:->
    h "messages-container", (@render_message for message in @messages)

class InputContainerView

  constructor:(message_being_edited)->
    @message_being_edited = message_being_edited

  message_input:->
    h "message-input", {placeholder:"Write your message"}, [@message_being_edited]

  render:->
    h "input-container", [@message_input()]

class RoomBodyView
  constructor:(room)->
    @room = room
    @messages_container =  new MessagesContainerView(@room.messages)
    @imput_container_view = new InputContainerView(@room.input)

  render:->
    options =
      name: @room.name
      type: @room.type

    h "room", options, [@messages_container.render(), @imput_container_view.render()]

class RoomFooterView

class RoomHeaderView

