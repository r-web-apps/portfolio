class WelcomeController < ApplicationController
  def index
    page = params[:page]
    if user_signed_in?
      per = 8
    else
      per = 9
    end
    @portfolio_list = Portfolio.order('year DESC, month DESC').page(page).per(per).without_count
    @comments = Comment.order('created_at').limit(10).reverse
  end
end
