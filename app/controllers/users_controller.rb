class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 20, :order => "username")
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def search(search)
    @user = User.search(search)
  end
end