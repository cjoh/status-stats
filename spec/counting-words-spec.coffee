require("words.js")

theContractForCountingWords = (countWords) ->
  describe "The contract for Counting Words", ->
    describe "counting words accurately for valid input", ->
      it "counts words for a simple text", ->
        expect(countWords("A very simple text.")).toBe(4)

      it "counts words for a multiline text", ->
        expect(countWords("""
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
  Nullam eros urna, dictum quis magna a, bibendum porttitor 
  ipsum. Donec ullamcorper ante ac eros auctor commodo. 
  Pellentesque eu nulla in est congue porttitor. Phasellus 
  quis pretium eros, eu sagittis nisi. Quisque at scelerisque 
  metus. Etiam mollis velit nec mi malesuada rutrum. Maecenas 
  in nibh et est suscipit bibendum quis et ligula. Sed 
  scelerisque luctus justo. Integer eget eros aliquam, ultrices 
  lorem ut, ornare metus. Duis vel varius felis.
  """)).toBe(77)

      it "handles the empty string", ->
        expect(countWords("")).toBe(0)

      it "handles non-empty whitespace", ->
        expect(countWords("\t\n\r \t\n \n\n\r")).toBe(0)

    describe "error paths, where it must not blow up", ->
      specialCases = 
        "null": null
        "NaN": NaN
        "an empty object": {}
        "an empty array": []
        "a non-empty object": {a: 1, b: 2, c: "hello" }
        "a non-empty array": [1, 2, 3, "hello"]

      (it "does not throw an error when its input is #{name}", ->
        expect( ->
          countWords(inputValue)
        ).not.toThrow()) for name, inputValue of specialCases

      (it "returns a number when its input is #{name}", ->
        expect(typeof countWords(inputValue)).toBe("number")) for name, inputValue of specialCases

class CountWordsWithWordsJs
  countWords: (text) ->
    new Words(text).count

describe "Counting Words with Words.js", ->
  theContractForCountingWords(new CountWordsWithWordsJs().countWords)
