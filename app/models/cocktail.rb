class Cocktail < ApplicationRecord

  def show
    ## display the created instance here
  end

  def create
    response = call_api
    Cocktail.new
  end

  private

  def call_api
    ## call the api here
  end

end
