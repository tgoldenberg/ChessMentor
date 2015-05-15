class Request < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_one :charge

  def send_notifications!
    user = recipient
    NotificationMailer.request_notification(user, self).deliver_later
  end

end
