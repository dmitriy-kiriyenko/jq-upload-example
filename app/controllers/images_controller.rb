class ImagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @images = current_user.images
  end

  def create
    current_user.images.create! params[:image].permit(:src)
    redirect_to root_url
  end
end
