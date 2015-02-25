TextStatistics = require("text-statistics")

describe "The textStatistics API", ->
  describe "Flesch-Kincaid measurements", ->
    describe "the happy path", ->
      beforeEach ->
        @textStatisticsApi = new TextStatistics("This is a very simple text.")

      it "computes grade level", ->
        gradeLevel = @textStatisticsApi.fleschKincaidGradeLevel()
        # According to http://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests#Flesch.E2.80.93Kincaid_Grade_Level
        # 0.39 * (6 / 1) + 11.8 * (8 / 6) - 15.59 ~= 2.5
        expect(gradeLevel).toBe(-0.7) # Uh... what?!

      it "computes reading ease", ->
        readingEase = @textStatisticsApi.fleschKincaidReadingEase()
        # According to http://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests#Flesch_Reading_Ease
        # 206.835 - 1.015 * (6 / 1) - 84.6 * (8 / 6) ~= 87.9
        expect(readingEase).toBe(106.6) # Uh... sure.
 
  describe "counting words, which it doesn't do well", ->
    it "sure as hell doesn't count words", ->
      textStatistics = new TextStatistics("What the fuck")
      expect(textStatistics.text).toBe("What the fuck.") # Works for me...
      expect(textStatistics.wordCount()).toBe(4) # I don't even...

    it "barfs on an empty string", ->
      expect( -> 
        new TextStatistics("").wordCount()
      ).toThrow()

    it "manages not to barf on whitespace", ->
      expect( ->
        new TextStatistics(" ").wordCount()
      ).not.toThrow()

