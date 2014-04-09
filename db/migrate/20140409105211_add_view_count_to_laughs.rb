class AddViewCountToLaughs < ActiveRecord::Migration
  def change
    add_column :laughs, :views, :integer
    add_column :laughs, :loads, :integer
  end
end
