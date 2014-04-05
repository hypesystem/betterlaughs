class CreateLaughs < ActiveRecord::Migration
  def change
    create_table :laughs do |t|
      t.string :title
      t.binary :file

      t.timestamps
    end
  end
end
