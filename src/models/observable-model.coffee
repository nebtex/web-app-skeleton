class ObservableModel

  constructor:(@parent)->
    @listeners = []
    @timestamp = Date.now()

  call_listener:(f)->
    f(@)

  observable:(listener)=>
    console.log(@)

    if not (listener?)
      return @

    @listeners.push(listener)
    remove = ()=>
      @listeners.splice(@listeners.indexOf(listener), 1)

    return remove

  commit:->
    @timestamp = Date.now()

    parent = @parent ? null

    if parent is null
      @call_listener listener for listener in @listeners
    else
      parent.commit()

module.exports = ObservableModel