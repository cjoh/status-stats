TextStatistics = require("text-statistics")

describe "The textStatistics API", ->
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

