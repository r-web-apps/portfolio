class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_portfolio, only: [:show, :destroy, :edit, :update]

  def index
    redirect_to root_path
  end

  def show
    @comment = Comment.new portfolio_id: @portfolio.id
  end

  def edit
  end

  def update
    if @portfolio.update portfolio_params
      flash[:success] = "Portfolio updated successfully!"
      redirect_to @portfolio
    else
      flash.now[:error] = "Item not saved. Please check your input."
      render 'edit'
    end
  end

  def destroy
    if @portfolio.destroy
      flash[:notice] = 'Portfolio item removed successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Portfolio item could not be removed.'
      redirect_to root_path
    end
  end

  def new
    @portfolio = Portfolio.new
  end


  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to @portfolio
    else
      render 'new'
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find params[:id]
  end
end

private

def portfolio_params
  params.require(:portfolio).permit(:title, :body, :picture, :icon, :likes, :year, :month, :link_href, :link_name)
end
