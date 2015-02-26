# fleschKincaidMeasure :: text -> number
theContractForComputingFleschKincaidMeasure = (fleschKincaidMeasure) ->
  describe "The contract for computing a Flesch-Kincaid measure", ->
    describe "handles valid input", ->
      @specialCases = 
        "small text": "This is a very simple text."
        "empty string": ""
        "non-empty whitespace": "\t\n\r \n\t "
        "longer text": """ I remember the first time I encountered this issue: in Steve McConnell’s excellent book Rapid Development, which I remember reading in 1997. (Wow! I should read it again.) He referred to “gold-plating” as one of his Classic Development Mistakes. You might immediately think, Uh… stop it!, but until then I hadn’t realised just how pervasively programmers in particular tended to do this. They would continue working on something, even though they’d solved the underlying problem. This sounded utterly insane to me. Suddenly, I saw it everywhere. I noticed when others did it. (They loved that.) I noticed when I did it. I didn’t really understand why.
  When I started practising test-first programming (and later test-driven development), this problem slowly disappeared—at least for a while. (Read on; you’ll see why.) For years, one of my IBM office mates challenged me to justify writing the tests first. He argued that as long as he wrote his tests and production code in tiny cycles, it didn’t much matter which he wrote first. For years, I never had a good answer for him. Of course, now that I do, I have no idea where to find him.  """ 

      @checks = (name, inputValue) ->
        it "does not throw an error when its input is #{name}", ->
          expect( ->
            fleschKincaidMeasure(inputValue)
          ).not.toThrow() 

      @checks(name, inputValue) for name, inputValue of @specialCases

    describe "error paths, where it must not blow up", ->
      @specialCases = 
        "null": null
        "NaN": NaN
        "an empty object": {}
        "an empty array": []
        "a non-empty object": {a: 1, b: 2, c: "hello" }
        "a non-empty array": [1, 2, 3, "hello"]

      @checks = (name, inputValue) ->
        it "does not throw an error when its input is #{name}", ->
          expect( ->
            fleschKincaidMeasure(inputValue)
          ).not.toThrow() 

        it "returns a number when its input is #{name}", ->
          expect(typeof fleschKincaidMeasure(inputValue)).toBe("number")
          
      @checks(name, inputValue) for name, inputValue of @specialCases

module.exports = 
  theContractForComputingFleschKincaidMeasure: theContractForComputingFleschKincaidMeasure

TextStatistics = require("text-statistics")
gradeLevelWithTextStatistics = (text) ->
  try
    new TextStatistics(text).fleschKincaidGradeLevel()
  catch
    0.0

readingEaseWithTextStatistics = (text) ->
  try
    new TextStatistics(text).fleschKincaidReadingEase()
  catch
    0.0

describe "Computing Flesch-Kincaid grade level with text-statistics", ->
  theContractForComputingFleschKincaidMeasure(gradeLevelWithTextStatistics)

describe "Computing Flesch-Kincaid reading ease with text-statistics", ->
  theContractForComputingFleschKincaidMeasure(readingEaseWithTextStatistics)

