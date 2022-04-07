class Cocktail < ApplicationRecord



  validates :name, presence: true


  validates :email,
  format: { with: /\w+@\w+\.\w+/, message: "invalid"  }




  def self.api(name)
    text = RestClient.get "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?s=#{name}"
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

    while !ingredient.nil? && ingredient != ""
      ingredients << ingredient
      number += 1
      ingredient = @data["drinks"][0]["strIngredient#{number}"]
    end

    return ingredients
  end


end
