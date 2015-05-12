class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :city
      t.string :country
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.integer :official_ranking
      t.integer :price
      t.integer :user_ranking
      t.string :provider

      t.timestamps null: false
    end
  end
end
