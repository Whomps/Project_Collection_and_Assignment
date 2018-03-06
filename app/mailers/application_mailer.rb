class ApplicationMailer < ActionMailer::Base
  default from: "Notifications <postmaster@sandbox9f41a046b3c944c0af9db799b43d9f6d.mailgun.org>"
  layout 'mailer'
end
