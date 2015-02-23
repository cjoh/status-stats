{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'

module.exports =
class DocumentStatsView extends View
  @content: ->
    @div class: "status-stats inline-block"

  initialize: (serializeState) ->
    @visible = true 

  toggle: ->
    if not @visible
      @show()
      @visible = true
    else
      @hide()
      @visible = false

  show: ->
    # implemented by lower layer
    @updateStats()
    super()
    
  hide: ->
    # implemented by lower layer
    super()

  updateStats: ->
    # update stats from whatever you're listening to


