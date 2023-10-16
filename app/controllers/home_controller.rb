class HomeController < ApplicationController
  def index
    @quotes = Quote.includes(:categories).take(5)
  end
end
