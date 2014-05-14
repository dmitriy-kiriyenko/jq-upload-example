class ImagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @images = current_user.images
  end

  def create
    params[:image][:src].each do |src|
      current_user.images.create! src: src
    end
    redirect_to root_url
  end

end
