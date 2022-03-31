class CocktailsController < ApplicationController

  before_action :api, only: [:index]

  def index
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
                             body:
                             "Ingredients: #{@ingredients}
                              Description: #{@description}",
                             from: 'whatsapp:+14155238886',
                             to: 'whatsapp:+31640110324'
                           )

  end

  private

  def api
    name = params[:name]
    response = Cocktail.api(name)
    @description = response[0]
    @ingredients = response[1]
  end

end
