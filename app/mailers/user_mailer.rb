class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset| Project Tracker"
    Rails.logger.debug("My objectmailer: #{@user.inspect}")
  end
end