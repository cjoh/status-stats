TextStatistics = require("text-statistics")

describe "The textStatistics API", ->
  describe "happy path example", ->
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

require("words.js")

describe "The Words API", ->
  it "counts words, maybe", ->
    words = new Words("There are four words!") 
    expect(words.count).toBe(4)

  it "presents the text back, for whatever nefarious purpose we choose", ->
    words = new Words("This is a pretty little string.")
    expect(words.$).toBe("This is a pretty little string.")

  it "counts the empty string!!!111!1!1!", ->
    expect(new Words("").count).toBe(0)
