json.array!(@requests) do |request|
  json.extract! request, :id, :body, :sender_id, :recipient_id, :seen
  json.url request_url(request, format: :json)
end
