DocumentStatsView = require '../lib/status-stats-view'

describe "Document stats view", ->
  describe "toggling visibility", ->
    hiddenDocumentStatsView = ->
      view = new DocumentStatsView()
      view.visible = false
      return view

    visibleDocumentStatsView = ->
      view = new DocumentStatsView()
      view.visible = true
      return view

    it "tries to show itself when it had been invisible", ->
      view = hiddenDocumentStatsView()

      spyOn(view, "show")
      spyOn(view, "hide")

      view.toggle()

      expect(view.show).toHaveBeenCalled()
      expect(view.hide).not.toHaveBeenCalled()

    it "tries to hide itself when it had been visible", ->
      view = visibleDocumentStatsView()

      spyOn(view, "show")
      spyOn(view, "hide")

      view.toggle()

      expect(view.show).not.toHaveBeenCalled()
      expect(view.hide).toHaveBeenCalled()

