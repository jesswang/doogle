class AddIndexToWordColumn < ActiveRecord::Migration
  def change
    add_index :definitions, :word
  end
end
