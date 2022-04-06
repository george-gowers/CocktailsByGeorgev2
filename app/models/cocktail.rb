class Cocktail < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true


  def self.api(name)
    text = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
    @data = JSON.parse(text)
    if !@data["drinks"].nil?
      return [instructions, ingredients]
    end
  end

  private

  def self.instructions
    instructions = @data["drinks"][0]["strInstructions"]
  end

  def self.ingredients
    ingredients = []
    ingredient = @data["drinks"][0]["strIngredient1"]
    number = 1

    while ingredient != ""
      ingredients << ingredient
      number += 1
      ingredient = @data["drinks"][0]["strIngredient#{number}"]
    end

    return ingredients
  end

end
