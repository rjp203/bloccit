class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "Welcome to Bloccit, #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
    @favorites = @user.favorites
  end
  
  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
