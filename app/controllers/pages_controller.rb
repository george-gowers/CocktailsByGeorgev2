class PagesController < ApplicationController
  def home
    @cocktail = Cocktail.new
  end
end
