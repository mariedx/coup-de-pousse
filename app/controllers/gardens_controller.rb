class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
    @user = @garden.user
  end
end
