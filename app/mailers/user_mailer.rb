class UserMailer < ApplicationMailer

  def welcome(hash)
    @ingredients = hash[:ingredients]
    @instructions = hash[:instructions]
    email = hash[:email]

    mail(to: "#{email}", subject: 'Cocktail Recipe')
  end

end
