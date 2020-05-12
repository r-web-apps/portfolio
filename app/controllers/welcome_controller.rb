class WelcomeController < ApplicationController
  def index
    page = params[:page]
    if user_signed_in?
      per = 5
    else
      per = 6
    end
    @portfolio_list = Portfolio.order('year DESC, month DESC').page(page).per(per)
    @comments = Comment.order('created_at').limit(10).reverse
  end
end
