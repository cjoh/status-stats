StatusStatsView = require './status-stats-view'

module.exports =
  StatusStatsView: null

  activate: (state) ->
    @StatusStatsView = new StatusStatsView(state.StatusStatsViewState)

  deactivate: ->
    @StatusStatsView.destroy()

  serialize: ->
    StatusStatsViewState: @StatusStatsView.serialize()
