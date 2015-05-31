class ChangeDefaultUserType < ActiveRecord::Migration
  def change
    change_column :users, :type, :string, default: "Learner"
  end
end
