{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'
DocumentStatsModel = require("./status-stats-model")

module.exports =
class DocumentStatsView extends View
  @model = null
  @content: ->
    @span class: "status-stats inline-block"

  initialize: (_) ->
    # jQuery's way to say "show"
    # http://api.jquery.com/toggle/
    @model = new DocumentStatsModel()
    @toggle(true) 

  # We need `args...` because we're overriding a jQuery function
  toggle: (args...) ->
    @updateStats()
    super(args)

  updateStats: ->
    # update stats from whatever you're listening to
    analysis = @model.analyseText("Hello there!")
    @text("#{analysis.wordCount} words; grade level #{analysis.gradeLevel}; reading ease #{analysis.readingEase}")
