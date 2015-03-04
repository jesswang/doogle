class RenameTable < ActiveRecord::Migration
  def change
    rename_table :dict_words, :definitions
  end
end
