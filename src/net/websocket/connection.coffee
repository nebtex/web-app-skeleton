class Connection

  constructor:(@state)->
    @listeners = {}
    @_socket = null

  connect:->
    #if connection exist do nothing
    if @_socket?
      return
    @_socket = new WebSocket(@state.websocket_uri)
    @_socket.onmessage = (evt)=>
      data = JSON.parse(evt.data)
      @emit(data.event, data.data)

  close:->
    @_socket.close()
    @_socket = null

  on:(evt, func)->
    if not (@listeners[evt]?)
      @listeners[evt] = []
    @listeners[evt].push(func)
    return

  emmit:(evt, data)->
    if not (@listener[evt]?)
      return
    func(data) for func in @listeners
    return


