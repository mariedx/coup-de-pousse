class UsersController < ApplicationController
    before_action :authenticate_user!

  def show
  @user = User.find(current_user.id)
  end

  def create
    flash[:notice] = "Registration needed"
  end

  
  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "Profil édité !"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Impossible d'éditer le profil :"
      render :edit
    end 
  end

  


end
