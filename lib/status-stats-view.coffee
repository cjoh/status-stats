{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'

module.exports =
class StatusStatsView extends View
  @content: ->
    @div class: "status-stats inline-block"

  initialize: (serializeState) ->
    atom.commands.add "atom-workspace", "status-stats:toggle", => @toggle()

  updateWordCount: =>
    # count words by simple regex
    # check for an empty editor! (Old plugin blew up.)
    # use text-statistics to get additional information
    # textstatistics = require "text-statistics"
    # ts = textstatistics(text)
    # @text("Words: #{count} Grade Level: #{ts.fleschKincaidGradeLevel()} Reading Ease: #{ts.fleschKincaidReadingEase()}").show()
    console.log("Status-Stats is ON THE AIR")
    # @text("Status-Status is ON THE AIR")

  serialize: ->

  destroy: ->
    @detach()

  attach: ->
    # append this view to the right of the status bar
    # Whenever contents are modified in a buffer, update the word count
    # Whenever we switch to a new active pane, update the word count
    # disposables = new CompositeDisposable
    # disposables.add atom.workspace.onDidChangeActivePaneItem, @updateWordCount
    # Update the word count now, just to be safe.
    @updateWordCount()

  toggle: ->
    if @hasParent() then @detach() else @attach()
