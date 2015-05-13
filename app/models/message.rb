class Message < ActiveRecord::Base
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  validates :body, presence: true
  
  belongs_to :conversation
  belongs_to :sender, class: 'User'
  belongs_to :recipient, class: 'User'
end
