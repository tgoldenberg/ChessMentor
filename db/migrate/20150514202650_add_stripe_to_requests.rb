class AddStripeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :stripe, :string
  end
end
