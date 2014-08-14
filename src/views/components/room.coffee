mercury = require("mercury")
root = exports ? this

class MessagesContainerView

  constructor:(messages)->
    @messages = messages

  render_message:(message)->

    properties =
      author:message.author.username,
      time:message.time,
      avatar:message.author.avatar
      content:message.content
      author_last_logging: message.author.last_logging

    h "message", properties

  render:->
    h "messages-container", (@render_message for message in @messages)

class InputMessageView

  constructor:(message_being_edited)->
    @message_being_edited = message_being_edited

  render:->
    properties=
      placeholder:"Write your message"
      "evt-key": mercury.keyEvent @send_message_event, 13  # only when the user press enter
      "evt-change":mercury.changeEvent @write_message_event

    h "message-input", properties, [@message_being_edited]

  send_message_event:->
    root.emitter.emit "new_message", {msg: @message_being_edited}

  write_message_event:->
    root.emitter.emit "write_message"


class RoomBodyView
  constructor:(room)->
    @messages_container_view =  new MessagesContainerView(@room.messages)

  render:->
    properties =
      name: @room.name
      type: @room.type

    return if @room.active then h "room-body", properties, [@messages_container_view.render()] else ""


class RoomFooterView

  constructor:(room)->
    @room = room
    @message_imput_view = new MessageInputView @room.message_input

  render:->
    properties =
      name: @room.name
      type: @room.type

    return if @room.active then  h "room-footer", properties, [@message_imput_view.render()] else ""


class RoomHeaderView

  constructor:(room)->
    @room = room

  render:->
    properties =
      name: @room.name
      type: @room.type

    return if @room.active then  h "room-header", properties else ""

