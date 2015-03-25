describe "wordDef", ->
  beforeAll ->
    @subject = new DoogleApp.Models.WordDef()

  it "should raise an alert if the word has no value", ->
    spyOn(window, "alert")
    @subject.validate({word: null})
    expect(window.alert).toHaveBeenCalledWith("Please enter a word!")

  it "should contain the word in the url", ->
    @subject.set({word: "sword"})
    expect(@subject.url()).toEqual("/definitions/sword")
