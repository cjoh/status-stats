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
