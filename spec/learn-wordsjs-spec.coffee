require("words.js")

describe "The Words API", ->
  describe "counting words", ->
    # CONTRACT
    # Words.count always answers a valid Number, even
    # when it encounters invalid input.
    # When the input is text, then .count appears to
    # answer the correct count of the words.
    # When the input is not text, then .count returns
    # an arbitrary Number, often 0.
    countWords = (text) ->
      new Words(text).count

    it "counts words, maybe", ->
      expect(countWords("There are four words!")).toBe(4)

    it "counts the empty string!!!111!1!1!", ->
      expect(countWords("")).toBe(0)

    it "gracefully handles null", ->
      expect(countWords(null)).toBe(0)

    it "gracefully handles no argument", ->
      expect(countWords()).toBe(0)

    it "gracefully handles NaN", ->
      expect(countWords(NaN)).toBe(0)

    it "gracefully handles an argument other than a string", ->
      expect(countWords({a: 1, b: 2, c: 3})).toBe(0)

    it "strangely handles an array of numbers", ->
      # since this...
      expect([1, 2, 3, 4] + '').toBe("1,2,3,4")
      # therefore that:
      expect(countWords([1, 2, 3, 4])).toBe(4)

    it "strangely handles numbers", ->
      # since this...
      expect(14723 + '').toBe("14723")
      # therefore that:
      expect(countWords(14723)).toBe(1)

