class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :book_id
      t.string :user_id

      t.timestamps
    end
  end
end
