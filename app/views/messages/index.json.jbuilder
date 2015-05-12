json.array!(@messages) do |message|
  json.extract! message, :id, :body, :sender_id, :recipient_id, :conversation_id
  json.url message_url(message, format: :json)
end
