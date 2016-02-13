DocumentStatsView = require("./status-stats-view")
DocumentStatsModel = require("./status-stats-model")

module.exports =
  activate: (state) ->
    @documentStatsView = new DocumentStatsView()
    atom.commands.add("atom-workspace", "status-stats:toggle", => @documentStatsView.toggle())

  consumeStatusBar: (statusBar) ->
    @statusBarTile = statusBar.addLeftTile(item: @documentStatsView.element, priority: 100)

  deactivate: ->
    @statusBarTile?.destroy()
    @statusBarTile = null
