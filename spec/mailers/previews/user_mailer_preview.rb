# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_order_email
    order = Order.first
    UserMailer.order_email(order).deliver_now
  end

end
