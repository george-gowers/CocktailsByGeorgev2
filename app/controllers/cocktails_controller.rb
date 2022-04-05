require 'net/http'
require 'uri'

class CocktailsController < ApplicationController

  before_action :api, only: [:mail]
  before_action :valid, only: [:mail]

  def mail
    UserMailer.welcome({ingredients: @ingredients, instructions: @instructions, email: @email }).deliver_now != true
  end

  private

  def api
    name = cocktail_params[:name]
    @email = cocktail_params[:email]
    @response = Cocktail.api(name)
  end

  def valid
    if @response.nil?
      render :not_valid
    else
      @instructions = @response[0]
      @ingredients = @response[1]
    end
  end

  def cocktail_params
    params.require(:mail).permit(:name, :email)
  end

end
