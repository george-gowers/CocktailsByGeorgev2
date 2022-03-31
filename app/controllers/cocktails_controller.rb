class CocktailController < ApplicationController

  # before_action :create, only: [:show]

  def index
    name = params[:name]
    response = Cocktail.api(name)
    @description = response[0]
    @ingredients = response[1]
  end

  # def create
  #   name = 'tonic'
  #   response = Cocktail.api(name)
  #   @description = response[0]
  #   @ingredients = response[1]
  # end

end
