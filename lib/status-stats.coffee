module.exports =
  activate: (state) ->
    console.log("activating plugin with state #{state}")

  deactivate: ->
    console.log("deactivating plugin")
