class ImagesController < ApplicationController
  def create
    files = params[:files].map do |file|
      photo = product.create :image => file
      image_url = photo.image_url
      image_name = File.basename(image_url, File.extname(image_url))
      { :name => image_name, :url =>  photo.image_url(:normal) }
    end
    render json: {files: files}
  end
end