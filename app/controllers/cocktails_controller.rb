class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      response = api_call
      if response != nil
        UserMailer.recipe(response).deliver_now
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
    return Cocktail.api(name)
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :email)
  end

end
