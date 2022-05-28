class UserMailer < ApplicationMailer

  def recipe(hash)
    @name = hash[:name]
    @preparation = hash[:instructions]
    @ingredients = hash[:ingredients]
    @image = hash[:image]
    email = hash[:email]

    mail(to: "#{email}", subject: 'Cocktail Recipe')
  end

end
