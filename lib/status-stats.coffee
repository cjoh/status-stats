StatusStatsView = require './status-stats-view'

module.exports =
  StatusStatsView: null

  activate: (state) ->
    @StatusStatsView = new StatusStatsView(state.StatusStatsViewState)

  consumeStatusBar: (statusBar) ->
    # SMELL Assumes that @StatusStatsView has been initialised
    @statusBarTile = statusBar.addLeftTile(item: @StatusStatsView, priority: 100)

  deactivate: ->
    @statusBarTile?.destroy()
    @StatusStatsView.destroy()

  serialize: ->
    StatusStatsViewState: @StatusStatsView.serialize()
