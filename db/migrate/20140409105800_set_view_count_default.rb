class SetViewCountDefault < ActiveRecord::Migration
  def change
    change_column :laughs, :views, :integer, default: 0
    change_column :laughs, :loads, :integer, default: 0
  end
end
