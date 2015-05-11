class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :remote_avatar, :string
    add_column :users, :mentor, :boolean, default: false
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :official_ranking, :integer
    add_column :users, :user_ranking, :integer
    add_column :users, :price, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
