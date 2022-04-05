require 'net/http'
require 'uri'

class CocktailsController < ApplicationController

  before_action :api, only: [:mail]

  def mail
    UserMailer.welcome({ingredients: @ingredients, instructions: @instructions, email: @email }).deliver_now
  end

  private

  def api
    name = params[:name]
    @email = params[:email]
    @response = Cocktail.api(name)
    if @response.nil?
      render :not_valid
    else
      @instructions = @response[0]
      @ingredients = @response[1]
    end
  end

end
