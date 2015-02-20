class CreateDictWords < ActiveRecord::Migration
  def change
    create_table :dict_words do |t|
      t.string :word
      t.string :definition

      t.timestamps null: false
    end
  end
end
