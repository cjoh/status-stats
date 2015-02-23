{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'

module.exports =
class DocumentStatsView extends View
  @content: ->
    @span class: "status-stats inline-block"

  initialize: (_) ->
    # jQuery's way to say "show"
    # http://api.jquery.com/toggle/
    @toggle(true) 

  # We need `args...` because we're overriding a jQuery function
  toggle: (args...) ->
    @updateStats()
    super(args)

  updateStats: ->
    # update stats from whatever you're listening to
    @text("THESE STATS MEAN NOTHING!")
