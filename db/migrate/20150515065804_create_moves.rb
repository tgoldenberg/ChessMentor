class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :notation
      t.string :piece
      t.references :room, index: true, foreign_key: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
