TextStatistics = require("text-statistics")

gradeLevel = (text) ->
  new TextStatistics(text).fleschKincaidGradeLevel()

readingEase = (text) ->
  new TextStatistics(text).fleschKincaidReadingEase()

describe "The textStatistics API", ->
  describe "Flesch-Kincaid measurements", ->
    describe "the happy path", ->
      it "computes grade level", ->
        # According to http://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests#Flesch.E2.80.93Kincaid_Grade_Level
        # 0.39 * (6 / 1) + 11.8 * (8 / 6) - 15.59 ~= 2.5
        expect(gradeLevel("This is a very simple text.")).toBe(-0.7) # Uh... what?!

      it "computes reading ease", ->
        # According to http://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests#Flesch_Reading_Ease
        # 206.835 - 1.015 * (6 / 1) - 84.6 * (8 / 6) ~= 87.9
        expect(readingEase("This is a very simple text.")).toBe(106.6) # Uh... sure.
 
    describe "a longer text", ->
      text = """
I remember the first time I encountered this issue: in Steve McConnell’s excellent book Rapid Development, which I remember reading in 1997. (Wow! I should read it again.) He referred to “gold-plating” as one of his Classic Development Mistakes. You might immediately think, Uh… stop it!, but until then I hadn’t realised just how pervasively programmers in particular tended to do this. They would continue working on something, even though they’d solved the underlying problem. This sounded utterly insane to me. Suddenly, I saw it everywhere. I noticed when others did it. (They loved that.) I noticed when I did it. I didn’t really understand why.
When I started practising test-first programming (and later test-driven development), this problem slowly disappeared—at least for a while. (Read on; you’ll see why.) For years, one of my IBM office mates challenged me to justify writing the tests first. He argued that as long as he wrote his tests and production code in tiny cycles, it didn’t much matter which he wrote first. For years, I never had a good answer for him. Of course, now that I do, I have no idea where to find him. 
      """

      # I got the expected results from https://readability-score.com/
      it "computes grade level", ->
        # should be 5.0
        expect(gradeLevel(text)).toBe(4.5)

      it "computes reading ease", ->
        # should be 77.3
        expect(readingEase(text)).toBe(79.2)

    describe "potential error paths", ->
      @specialCases = 
        "null": null
        "NaN": NaN
        "an empty object": {}
        "an empty array": []
        "a non-empty object": {a: 1, b: 2, c: "hello" }
        "a non-empty array": [1, 2, 3, "hello"]

      @checks = (name, inputValue) ->
        it "sadly throws an error when its input is #{name}", ->
          expect( ->
            gradeLevel(inputValue)
          ).toThrow() 
          expect( ->
            readingEase(inputValue)
          ).toThrow() 
          
      @checks(name, inputValue) for name, inputValue of @specialCases
    
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

