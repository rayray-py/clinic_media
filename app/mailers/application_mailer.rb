class ApplicationMailer < ActionMailer::Base
  default from: Settings.mailer[:address]
  layout 'mailer'
end
