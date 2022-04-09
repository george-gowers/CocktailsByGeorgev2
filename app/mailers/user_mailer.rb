class UserMailer < ApplicationMailer

  def recipe(hash)
    @ingredients = hash[:ingredients]
    @instructions = hash[:instructions]
    @image = hash[:image]
    @name = hash[:name]
    email = hash[:email]

    mail(to: "#{email}", subject: 'Cocktail Recipe')
  end

end
