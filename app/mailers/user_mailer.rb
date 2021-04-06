class UserMailer < ApplicationMailer
  default from: 'tester1337bbq@gmail.com'
  
  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Order ##{@order.id} Receipt") 
  end

end
