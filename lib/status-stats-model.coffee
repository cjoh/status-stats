# REFACTOR Move to a very cool utility library
rescueFunction = (func, rescueResult) ->
  try
    func()
  catch
    rescueResult

require("words.js")
TextStatistics = require("text-statistics")

module.exports =
class DocumentStatsModel
  analyseText: (text) ->
    return {
      wordCount: @countWords(text)
      gradeLevel: @gradeLevel(text)
      readingEase: @readingEase(text)
      readingTime: @readingTime(text)
    }

  countWords: (text) ->
    new Words(text).count

  readingTime: (text) ->
    new Words(text).count / 200

  gradeLevel: (text) ->
    rescueFunction(
      () -> new TextStatistics(text).fleschKincaidGradeLevel(),
      0.0)

  readingEase: (text) ->
    rescueFunction(
      () -> new TextStatistics(text).fleschKincaidReadingEase(),
      0.0)
