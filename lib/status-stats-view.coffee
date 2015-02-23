{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'

module.exports =
class DocumentStatsView extends View
  @content: ->
    @div class: "status-stats inline-block"

  initialize: (serializeState) ->
    # do nothing so far

  toggle: ->
    @show()

  show: ->
    # implemented by a lower layer, I guess


