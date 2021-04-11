class NotificationMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'
  
  def complete_mail(user)
    @user = user
    mail(subject: "登録が完了しました" ,to: @user.email)
  end
end
