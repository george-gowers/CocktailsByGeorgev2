class CocktailsController < ApplicationController

  before_action :api_call, only: [:create]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      if valid?
        @instructions = @response[0]
        @ingredients = @response[1]
        UserMailer.welcome({ingredients: @ingredients, instructions: @instructions, email: @email }).deliver_now
      else
        redirect_to cocktails_not_valid_path
      end
    else
      render :new
    end
  end

  def not_valid
  end

  def mail_not_valid
  end

  private

  def api_call
    name = cocktail_params[:name]
    @email = cocktail_params[:email]
    @response = Cocktail.api(name)
  end

  def valid?
    !@response.nil?
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :email)
  end

end
