require 'rails_helper'

RSpec.describe Definition, type: :model do
  it "saves words as lower-case" do
    dictionary_entry = Definition.create!(word: "Cat", meaning: "a feline creature")
    dictionary_entry.save!
    expect(dictionary_entry.word).to eq "cat"
  end
end
