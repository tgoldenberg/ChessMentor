class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.references :invitation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
