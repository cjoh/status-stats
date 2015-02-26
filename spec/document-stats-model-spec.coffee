{theContractForCountingWords} = require("./counting-words-spec")
{theContractForComputingFleschKincaidMeasure} = require("./flesch-kincaid-stats-spec")

# REFACTOR Move to a very cool utility library
rescueFunction = (func, rescueResult) ->
  try
    func()
  catch
    rescueResult

require("words.js")
TextStatistics = require("text-statistics")
# REFACTOR Align this with the other version of this class.
class DocumentStatsModel
  countWords: (text) ->
    new Words(text).count

  gradeLevel: (text) ->
    rescueFunction(
      () -> new TextStatistics(text).fleschKincaidGradeLevel(),
      0.0)

  readingEase: (text) ->
    rescueFunction(
      () -> new TextStatistics(text).fleschKincaidReadingEase(),
      0.0)

describe "DocumentStatsModel", ->
  describe "Counting words", ->
    theContractForCountingWords((new DocumentStatsModel()).countWords)

  describe "Flesch-Kincaid Grade Level", ->
    theContractForComputingFleschKincaidMeasure((new DocumentStatsModel()).gradeLevel)

  describe "Flesch-Kincaid Reading Ease", ->
    theContractForComputingFleschKincaidMeasure((new DocumentStatsModel()).readingEase)


