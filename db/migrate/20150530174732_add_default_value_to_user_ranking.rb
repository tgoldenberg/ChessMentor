class AddDefaultValueToUserRanking < ActiveRecord::Migration
  def change
    change_column :users, :user_ranking, :integer, default: 0
  end
end
