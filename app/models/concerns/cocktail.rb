class Cocktail < ApplicationRecord

  validates :name,
  format: { with: /[a-zA-Z]+/, message: "invalid"  }

  validates :email,
  format: { with: /\w+@\w+\.\w+/, message: "invalid"  }

  # def self.api(name)
  #   url = "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?s=#{name}"
  #   URI.encode(url)
  #   url = RestClient.get(url)
  #   @data = JSON.parse(url)
  #   if !@data["drinks"].nil?
  #     return [instructions, ingredients, image, cocktail_name]
  #   end
  # end

  # private

  # def self.instructions
  #   @data["drinks"][0]["strInstructions"]
  # end

  # def self.ingredients
  #   ingredients = []
  #   ingredient = @data["drinks"][0]["strIngredient1"]
  #   number = 1

  #   while !ingredient.nil? && ingredient != ""
  #     ingredients << ingredient
  #     number += 1
  #     ingredient = @data["drinks"][0]["strIngredient#{number}"]
  #   end

  #   return ingredients
  # end

  # def self.image
  #   @data["drinks"][0]["strDrinkThumb"]
  # end

  # def self.cocktail_name
  #   name = @data["drinks"][0]["strDrink"]
  # end

  ###########################################################

  def self.api(name)
    url = "https://cocktail-database-api.herokuapp.com/api/v1/cocktails/search?name=#{name}"
    URI.encode(url)
    url = RestClient.get(url)
    @data = JSON.parse(url)
    if !@data.nil?
      return [cocktail_name, preparation, ingredients, image]
    end
  end

  private

  def self.cocktail_name
    name = @data[0]["name"]
  end

  def self.preparation
    instructions = @data[0]["preparation"]
  end

  def self.ingredients
    ingredients = @data[0]["ingredients"]
  end

  def self.image
    image= @data[0]["image"]
  end

end
