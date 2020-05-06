class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    portfolio = Portfolio.find params[:comment][:portfolio_id]
    if @comment.save
      redirect_to portfolio
    else
      render 'portfolios/new', id: portfolio.id
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :portfolio_id)
  end
end
