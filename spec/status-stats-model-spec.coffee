DocumentStatsModel = require("../lib/status-stats-model")

describe "Document Stats Model", ->
  describe "smoke tests", ->
    beforeEach ->
      @model = new DocumentStatsModel()

    it "analyses valid text", ->
      analysis = @model.analyseText("This is a really simple bit of text.")
      expect(analysis.wordCount).toBe(8)
      expect(analysis.gradeLevel).toBe(-2.0)
      expect(analysis.readingEase).toBe(117.7)

    it "handles empty text", ->
      analysis = @model.analyseText("\n \t \t \r \n  \n\n \t\t\n")
      expect(analysis.wordCount).toBe(0)
      expect(analysis.gradeLevel).toBe(-9.3)
      expect(analysis.readingEase).toBe(163.5)

