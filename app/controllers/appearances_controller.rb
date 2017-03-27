class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
    if params[:episode_id]
      @episode = Episode.find(params[:episode_id])
      @appearance.episode = @episode
    end
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path, alert: "Something went wrong with booking this appearance."
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to edit_appearance_path(@appearance), alert: "Please make sure the rating is between 1 and 5."
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :user_id, :rating)
  end

end
