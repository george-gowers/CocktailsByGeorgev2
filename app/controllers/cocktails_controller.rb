class CocktailsController < ApplicationController

  before_action :api_call, only: [:create]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      if valid_cocktail?
        @instructions = @response[0]
        @ingredients = @response[1]
        UserMailer.welcome({ingredients: @ingredients, instructions: @instructions, email: @email }).deliver_now
      else
        render :not_valid
      end
    else
      render :new
    end
  end

  private

  def api_call
    name = cocktail_params[:name]
    @email = cocktail_params[:email]
    @response = Cocktail.api(name)
  end

  def valid_cocktail?
    !@response.nil?
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :email)
  end

end
