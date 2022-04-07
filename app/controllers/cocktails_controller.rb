class CocktailsController < ApplicationController

  before_action :api, only: [:create]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      is_valid_cocktail?
      UserMailer.welcome({ingredients: @ingredients, instructions: @instructions, email: @email }).deliver_now
    else
      render :new
    end
  end

  private

  def api
    name = cocktail_params[:name]
    @email = cocktail_params[:email]
    @response = Cocktail.api(name)
  end

  def is_valid_cocktail?
    if @response.nil?
      render :not_valid
    else
      @instructions = @response[0]
      @ingredients = @response[1]
    end
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :email)
  end

end
