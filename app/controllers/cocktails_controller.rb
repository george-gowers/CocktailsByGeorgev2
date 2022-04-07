class CocktailsController < ApplicationController

  before_action :api_call, only: [:create, :valid?]

  def new
    @cocktail = Cocktail.new
  end

  def create
    response = api_call
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      valid?
      UserMailer.welcome({ingredients: @ingredients, instructions: @instructions, email: @email }).deliver_now
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

  def valid?
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
