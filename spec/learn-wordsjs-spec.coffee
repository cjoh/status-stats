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

  it "gracefully handles null", ->
    expect(new Words(null).count).toBe(0)

  it "gracefully handles no argument", ->
    expect(new Words().count).toBe(0)

  it "gracefully handles NaN", ->
    expect(new Words(NaN).count).toBe(0)

  it "gracefully handles an argument other than a string", ->
    expect(new Words({a: 1, b: 2, c: 3}).count).toBe(0)
    # WTF? Are strings and arrays of characters related in Javascript?
    expect(new Words([1, 2, 3, 4]).count).toBe(0)

