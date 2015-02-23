DocumentStatsView = require '../lib/status-stats-view'

describe "Document stats view", ->
  describe "toggling visibility", ->
    hiddenDocumentStatsView = ->
      view = new DocumentStatsView()
      # SMELL Uses a back door. Maybe OK.
      view.detach()
      return view

    it "appears when it had been invisible", ->
      view = hiddenDocumentStatsView()

      spyOn(view, "show")
      spyOn(view, "hide")

      view.toggle()

      expect(view.show).toHaveBeenCalled()
      expect(view.hide).not.toHaveBeenCalled()
