require 'rails_helper'

RSpec.describe Definition, type: :model do
  let!(:definition) { Definition.create!(word: "Cat", meaning: "a carnivorous mammal") }

  it "saves words as lower-case" do
    expect(definition.word).to eq "cat"
  end

  it "does not save the definition if the word value is missing" do
    definition.word = nil
    expect(definition).to_not be_valid
  end

  it "does not save the definition if the meaning value is missing" do
    definition.meaning = nil
    expect(definition).to_not be_valid
  end
end
