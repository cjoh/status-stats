DocumentStatsView = require '../lib/status-stats-view'

describe "Document stats view", ->
  describe "toggling the view", ->
    # Since I don't know whether I'm showing or hiding,
    # update the stats both ways.
    it "updates the stats", ->
      view = new DocumentStatsView()
      spyOn(view, "updateStats")

      view.toggle()
      expect(view.updateStats).toHaveBeenCalled()

