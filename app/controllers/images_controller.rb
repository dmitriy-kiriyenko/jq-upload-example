class ImagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @images = current_user.images
    respond_to do |format|
      format.html
      format.json { render json: @images.map(&:to_jq_upload).to_json }
    end
  end

  def new
    @image = current_user.images.build
  end

  def create
    files = Array(params[:image][:src]).map do |src|
      current_user.images.create! src: src
    end
    render json: { files: files.map(&:to_jq_upload) }
  end

  def destroy
    @image = current_user.images.find(params[:id])
    @image.destroy
    render :json => true
  end

end
