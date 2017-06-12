class UserMailer < ApplicationMailer
    #  default from: 'grupo11.iic2513@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://morning-plains-27189.herokuapp.com'
    mail(to: @user.mail, subject: 'Welcome to the best App!') 
  end

  def donate(user, proyect, amount)
    @user = user
    @proyect = proyect
    @amount = amount
    mail(to: @user.mail, subject: "Somebody just donated to your proyect!")
  end

  def goal_money_ready(user, proyect)
    @user = user
    @proyect = proyect
    mail(to: @user.mail, subject: "A proyect you donated to has just reached its goal money")
  end

  def goal_money_founder(user, proyect)
    @user = user
    @proyect = proyect
    mail(to: @user.mail, subject: "Your proyect has just reached its goal money")
  end
end
