class Cocktail < ApplicationRecord

  def self.api(name)
    text = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}"
    @data = JSON.parse(text)
    return [description, ingredients]
  end

  private

  def self.description
    description = @data["drinks"][0]["strInstructions"]
  end

  def self.ingredients
    ingredient1 = @data["drinks"][0]["strIngredient1"]
    ingredient2 = @data["drinks"][0]["strIngredient2"]
    ingredient3 = @data["drinks"][0]["strIngredient3"]
    ingredient4 = @data["drinks"][0]["strIngredient4"]
    ingredients = "#{ingredient1}, #{ingredient2}, #{ingredient3}, #{ingredient4}"
  end

end
