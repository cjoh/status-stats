DocumentStatsView = require("./status-stats-view")

module.exports =
  activate: (state) ->
    console.log("activating plugin with state #{state}")
    @documentStatsView = new DocumentStatsView()
    atom.commands.add("atom-workspace", "status-stats:toggle", => @documentStatsView.toggle())

  consumeStatusBar: (statusBar) ->
    console.log("consuming status bar")
    @statusBarTile = statusBar.addLeftTile(item: @documentStatsView.element, priority: 100)

  deactivate: ->
    console.log("deactivating plugin")
    @statusBarTile?.destroy()
    @statusBarTile = null
