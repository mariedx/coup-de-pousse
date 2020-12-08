class GardensController < ApplicationController

  def new
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
    @user = @garden.user

  end

  def edit 
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])
    if @garden.update(gardens_params)
      flash[:notice] = "Annonce éditée !"
      redirect_to garden_path(@garden.id)
    else
      flash.now[:alert] = "Impossible d'éditer l'annonce' :"
      render :edit
    end
  end


  def create
    @garden = Garden.create(gardens_params)
    @garden.user = current_user
      if @garden.save
        redirect_to root_path
        flash[:success] = "Annonce créée avec succès !"
      else
        render :new
      end
  end

  def index
    @gardens = Garden.search(params[:search])
  end

  def destroy 
  Garden.find(params[:id]).destroy
    if @garden.destroy 
      redirect_to root_path
      flash[:success] = "Annonce supprimée"
    end 
  end 

  private

  def gardens_params
    params.require(:garden).permit(:title, :description, :orientation, :floor_type, :is_available, :parking, :tools_available, :surface, :address_id, pictures: [])
  end

end

