class AddRequestIdToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :request_id, :integer
  end
end
