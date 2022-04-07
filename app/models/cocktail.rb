class Cocktail < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true


  def self.api(name)
    text = RestClient.get "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?s=#{name}"
    @data = JSON.parse(text)
    if !@data["drinks"].nil?
      return [instructions, ingredients]
    end
  end

  # def self.api(name)
  #   return ["fill glass", ["lemon", "ice"]]
  # end

  private

  def self.instructions
    instructions = @data["drinks"][0]["strInstructions"]
  end

  def self.ingredients
    ingredients = []
    ingredient = @data["drinks"][0]["strIngredient1"]
    number = 1
    # ingredient6 = @data["drinks"][0]["strIngredient6"]


    # while ingredient != "" && !ingredient != nil
    #   ingredients << ingredient
    #   number += 1
    #   ingredient = @data["drinks"][0]["strIngredient#{number}"]
    # end

    while !ingredient.nil? && ingredient != ""
      ingredients << ingredient
      number += 1
      ingredient = @data["drinks"][0]["strIngredient#{number}"]
    end

    return ingredients
  end

  # def self.ingredients
  #   ingredient1 = @data["drinks"][0]["strIngredient1"]
  #   ingredient2 = @data["drinks"][0]["strIngredient2"]
  #   ingredient3 = @data["drinks"][0]["strIngredient3"]
  #   ingredient4 = @data["drinks"][0]["strIngredient4"]
  #   ingredient4 = @data["drinks"][0]["strIngredient5"]
  #   ingredient4 = @data["drinks"][0]["strIngredient6"]
  #   return [ingredient1, ingredient2, ingredient3, ingredient4]
  # end

end
