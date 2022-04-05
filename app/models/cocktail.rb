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
    ingredient1 = @data["drinks"][0]["strIngredient1"]
    ingredient2 = @data["drinks"][0]["strIngredient2"]
    ingredient3 = @data["drinks"][0]["strIngredient3"]
    ingredient4 = @data["drinks"][0]["strIngredient4"]
    ingredients = "#{ingredient1}, #{ingredient2}, #{ingredient3}, #{ingredient4}"
  end

end
