class ContactMailer < ApplicationMailer
  def send_mail_to_support(name, email, content)
    @name = name
    @email = email
    @content = content
    mail to: Settings.mailer[:address], subject: "【#{@name}様よりお問い合わせ】"
  end

  def send_mail_to_user(name, email, content)
    @name = name
    @email = email
    @content = content
    mail to: email, subject: "【クリニックリスト運営】お問い合わせを受付いたしました。", from: "クリニックリスト運営"
  end
end
