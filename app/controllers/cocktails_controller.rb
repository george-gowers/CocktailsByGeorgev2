class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      api_call
      if valid_cocktail?
        @instructions = @response[0]
        @ingredients = @response[1]
        @image = @response[2]
        @name = @response[3]
        UserMailer.recipe({ingredients: @ingredients, instructions: @instructions, image: @image, name: @name, email: @email }).deliver_now
        redirect_to mail_path
      else
        redirect_to not_valid_path
      end
    else
      render :new
    end
  end

  def reroute
    redirect_to root_path
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
