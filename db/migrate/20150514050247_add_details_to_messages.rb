class AddDetailsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :avatar_url, :string
    add_column :messages, :created_time, :string
  end
end
