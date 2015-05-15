class NotificationMailer < ApplicationMailer

  def request_notification(user, request)
    @request = request
    @user = user

    mail(
      to: "#{@user.email}",
      subject: "[ChessMeet] New request from #{@request.sender.name}."
    )
  end


end
