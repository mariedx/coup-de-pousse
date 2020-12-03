class GardensController < ApplicationController

  def new 
    @garden = Garden.new
  end 

  def create
    @user.id = current_user.id
    @garden = Garden.create(gardens_params)

      if @garden.save 
         redirect_to root_path
         flash[:success] = "Annonce créée avec succès !"

      else
        render :new
      end
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def index
    @gardens = Garden.all
  end


  private
  def gardens_params
    gardens_params = params.require(:garden).permit(:title, :description, :orientation, :floor_type, :is_available, :parking, :tools_available, :surface, :image_url)
  end


end

