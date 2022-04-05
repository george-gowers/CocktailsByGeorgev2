class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject

  # def welcome(hash)
  #   @ingredients = hash[:ingredients]
  #   @instructions = hash[:instructions]
  #   email = hash[:email]

  #   mail(to: "#{email}", subject: 'Cocktail Recipe')
  # end

  def welcome
    mail to: "georgegowers@gmail.com", subject: 'Cocktail Recipe'
  end
end
