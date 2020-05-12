class WelcomeController < ApplicationController
  def index
    page = params[:page]
    per = if user_signed_in? 5
          else
            6
          end
    @portfolio_list = Portfolio.order('year DESC, month DESC').page(page).per(per)
    @comments = Comment.order('created_at').limit(10).reverse
  end
end
