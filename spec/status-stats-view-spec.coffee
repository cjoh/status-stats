DocumentStatsView = require '../lib/status-stats-view'

describe "Document stats view", ->
  describe "toggling the view", ->
    it "updates the stats", ->
      view = new DocumentStatsView()
      spyOn(view, "updateStats")

      view.toggle()
      expect(view.updateStats).toHaveBeenCalled()

