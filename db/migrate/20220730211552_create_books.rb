class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.string :thumbnail
      t.string :isbn
      t.boolean :state
      t.string :author

      t.timestamps
    end
  end
end
