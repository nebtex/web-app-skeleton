clone = require("./clone")
update = module.exports = (base, obj) ->
  if not obj? or typeof obj isnt 'object'
    return base

  for key of obj
    if Object.prototype.toString.call(obj[key]) is "[object Object]"
      if not(base[key]?)
        base[key] = {}
      update(base[key], obj[key])
    else
      base[key] = clone obj[key]

  return base
