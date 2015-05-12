class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.references :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
