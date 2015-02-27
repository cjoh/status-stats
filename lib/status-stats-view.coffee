{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'
DocumentStatsModel = require("./status-stats-model")

module.exports =
class DocumentStatsView extends View
  @content: ->
    @span class: "status-stats inline-block"

  initialize: (_) ->
    # jQuery's way to say "show"
    # http://api.jquery.com/toggle/
    @toggle(true) 
    @model = new DocumentStatsModel()

  # We need `args...` because we're overriding a jQuery function
  toggle: (args...) ->
    @updateStats()
    super(args)

  updateStats: ->
    # update stats from whatever you're listening to
    analysis =
      words: 100
      gradeLevel: 5.4
      readingEase: 99.2
    @text("#{analysis.words} words; grade level #{analysis.gradeLevel}; reading ease #{analysis.readingEase}")
