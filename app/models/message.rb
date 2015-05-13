class Message < ActiveRecord::Base
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  validates :body, presence: true

  belongs_to :conversation
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
end
