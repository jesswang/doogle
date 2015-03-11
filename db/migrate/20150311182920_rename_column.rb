class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :definitions, :definition, :meaning
  end
end
