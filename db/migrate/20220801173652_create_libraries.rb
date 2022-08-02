class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries, column_options: { null: false, foreign_key: true } do |t|
      #t.index :user_id
      #t.index :book_id

      t.timestamps
    end
  end
end
