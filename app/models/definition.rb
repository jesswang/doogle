class Definition < ActiveRecord::Base
  before_save { word.downcase! }
  validates :word, presence: true
  validates :definition, presence: true
end
