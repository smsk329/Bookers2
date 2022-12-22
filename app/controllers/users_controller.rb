class UsersController < ApplicationController
  
  def index
  end

  def edit
    @user = User.find(params[:id])
  end
  
    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(current_user.id)  
    end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
