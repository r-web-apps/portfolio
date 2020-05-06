class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    render plain: 'Test success'
  end
end
