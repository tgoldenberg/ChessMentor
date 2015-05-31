class AddDefaultValueToUserType < ActiveRecord::Migration
  def change
    change_column :users, :type, :string, default: "learner"
  end
end
