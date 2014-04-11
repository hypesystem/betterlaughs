class AddSourceToLaughs < ActiveRecord::Migration
  def change
    add_column :laughs, :source, :string
  end
end
