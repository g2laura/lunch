class Mailer < ActionMailer::Base
  include Resque::Mailer
  default from: "admin@admios-sa.com"

  def reminder(user)
    @user = user
    mail(:to => @user.email, :subject => " Hi #{@user.name}, place your order for today's lunch ")
  end

end