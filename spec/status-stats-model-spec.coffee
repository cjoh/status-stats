require("words.js")
TextStatistics = require("text-statistics")

class DocumentStatsModel
  initialize: ->
    # nothing

  analyseText: (text) ->
    return {
      wordCount: new Words(text).count,
      gradeLevel: new TextStatistics(text).fleschKincaidGradeLevel(),
      readingEase: new TextStatistics(text).fleschKincaidReadingEase()
    }

describe "Document Stats Model", ->
  describe "happy paths", ->
    it "counts words", ->
      model = new DocumentStatsModel()
      analysis = model.analyseText("This is a really simple bit of text.")
      expect(analysis.wordCount).toBe(8)
      expect(analysis.gradeLevel).toBe(-2.0)
      expect(analysis.readingEase).toBe(117.7)
