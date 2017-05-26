class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(create_params)
    if @contact.save
      ContactMailer.send_mail_to_support(@contact.name, @contact.email , @contact.content).deliver
      ContactMailer.send_mail_to_user(@contact.name, @contact.email , @contact.content).deliver
      redirect_to :root, notice: "お問い合わせ内容が送信されました。"
    else
      render :new
    end
  end

  private
    def create_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
