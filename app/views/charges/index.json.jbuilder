json.array!(@charges) do |charge|
  json.extract! charge, :id, :description, :user_id, :vendor_id, :token, :customer_id, :completed, :price
  json.url charge_url(charge, format: :json)
end
