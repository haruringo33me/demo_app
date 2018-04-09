class UsersController < ApplicationController
  before_action :authenticate_user!, :except=>[:show]
  before_action :admin_user, only: :destroy
  
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User has been destroyed."
    redirect_to users_url
  end
  
  private
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
  
end
