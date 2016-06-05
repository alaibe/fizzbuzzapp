class FavoritesController < ApplicationController

  before_action :restrict_access!

  def index
    render json: current_user.favorites
  end

  def create
    favorite = current_user.create_favorite(favorites_params)
    if favorite.persisted?
      render json: favorite, status: :created
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  private

  def favorites_params
    params.require(:favorite).permit(:offset)
  end

end