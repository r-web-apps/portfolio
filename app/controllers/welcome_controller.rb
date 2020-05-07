class WelcomeController < ApplicationController
  def index
    @portfolio_list = Portfolio.order('year DESC, month DESC').all
    @comments = Comment.order('created_at').limit(10).reverse
  end
end
