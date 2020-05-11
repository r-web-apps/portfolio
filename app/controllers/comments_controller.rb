class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    portfolio = Portfolio.find params[:comment][:portfolio_id]
    if @comment.save
      redirect_to portfolio
    else
      flash[:warning] = 'Please enter at least 5 symbols.' if @comment.body.length < 5
      flash[:warning] = 'Please enter not more than 3000 symbols.' if @comment.body.length > 3000
      redirect_to portfolio
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :portfolio_id)
  end
end
