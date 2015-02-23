{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'

module.exports =
class DocumentStatsView extends View
  @content: ->
    @span class: "status-stats inline-block"

  initialize: (serializeState) ->
    # nothing to do

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
    @text("THESE STATS MEAN NOTHING!")
