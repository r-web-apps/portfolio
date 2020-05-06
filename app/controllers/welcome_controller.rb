class WelcomeController < ApplicationController
  def index
    @portfolio_list = Portfolio.order('year DESC, month DESC').all
  end
end
