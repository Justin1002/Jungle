class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  
  def order_email
    @user = params[:user]

end
