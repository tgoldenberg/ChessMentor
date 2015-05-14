class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :seen, default: false

      t.timestamps null: false
    end
  end
end
