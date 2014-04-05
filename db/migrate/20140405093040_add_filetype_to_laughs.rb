class AddFiletypeToLaughs < ActiveRecord::Migration
  def change
    add_column :laughs, :filetype, :string
  end
end
