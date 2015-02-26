describe("WordDef model", function() {
  var view;

  beforeAll(function() {
    view = new DoogleApp.Views.WordDefsView();
  });

  it("should validate text in the search input", function() {
    $('input[type="search"]').val("");
    view.search();
    expect(view.model.fetch().not.toHaveBeenCalled());
  });
});