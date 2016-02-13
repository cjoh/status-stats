{theContractForCountingWords} = require("./counting-words-spec")
{theContractForComputingFleschKincaidMeasure} = require("./flesch-kincaid-stats-spec")
DocumentStatsModel = require("../lib/status-stats-model.coffee")

describe "DocumentStatsModel", ->
  describe "Counting words", ->
    theContractForCountingWords((new DocumentStatsModel()).countWords)

  describe "Flesch-Kincaid Grade Level", ->
    theContractForComputingFleschKincaidMeasure((new DocumentStatsModel()).gradeLevel)

  describe "Flesch-Kincaid Reading Ease", ->
    theContractForComputingFleschKincaidMeasure((new DocumentStatsModel()).readingEase)


