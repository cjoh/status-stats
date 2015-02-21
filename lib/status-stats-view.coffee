{View} = require 'atom-space-pen-views'

module.exports =
class StatusStatsView extends View
  @content: ->
    @div class: "status-stats inline-block"

  initialize: (serializeState) ->
    atom.commands.add "atom-workspace", "status-stats:toggle", => @toggle()

  updateWordCount: =>
    editor = atom.workspaceView.getActivePaneItem()
    count = editor.getText().match(/\S+/g).length
    editor = atom.workspace.activePaneItem
    text = editor.getText()
    textstatistics = require "text-statistics"
    ts = textstatistics(text)
    @text("Words: #{count} Grade Level: #{ts.fleschKincaidGradeLevel()} Reading Ease: #{ts.fleschKincaidReadingEase()}").show()

  serialize: ->

  destroy: ->
    @detach()

  attach: ->
    statusbar = atom.workspaceView.statusBar
    statusbar.appendRight this

    atom.workspaceView.eachEditorView (editor) =>
      @subscribe editor.getEditor().getBuffer(), "contents-modified", @updateWordCount

    @subscribe atom.workspaceView, "pane-container:active-pane-item-changed", @updateWordCount

    @updateWordCount()

  toggle: ->
    if @hasParent() then @detach() else @attach()
