class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to root_path
  end
end
