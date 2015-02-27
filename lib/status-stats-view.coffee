{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'
DocumentStatsModel = require("./status-stats-model")

module.exports =
class DocumentStatsView extends View
  @content: ->
    @span class: "status-stats inline-block"

  initialize: (_) ->
    # SMELL Programming by coincidence.
    # We must initialise the model before showing stats
    # with @toggle(true)
    @model = new DocumentStatsModel()

    # When switching panes, updateStats
    atom.workspace.onDidChangeActivePaneItem((activePaneItem) =>
      @updateStats())

    # When the active buffer changes, updateStats
    atom.workspace.observeTextEditors((editor) =>
      editor.onDidChange(() =>
        @updateStats()))

    # jQuery's way to say "show"
    # http://api.jquery.com/toggle/
    @toggle(true) 

  # We need `args...` because we're overriding a jQuery function
  toggle: (args...) ->
    @updateStats()
    super(args)

  updateStats: ->
    activeDocumentText = atom.workspace.getActiveTextEditor().getText()
    analysis = @model.analyseText(activeDocumentText)
    @text("#{analysis.wordCount} words; grade level #{analysis.gradeLevel}; reading ease #{analysis.readingEase}")
