class CocktailsController < ApplicationController

  before_action :api, only: [:index]

  def index
    account_sid = 'ACdda5d58aa60f5a284b47286328bfe0df'
    auth_token = '17b42ae9fe5359a0cdd9070033dd48c5'
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
