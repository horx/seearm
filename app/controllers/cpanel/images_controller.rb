class Cpanel::ImagesController < Cpanel::ApplicationController

  def create
    # 浮动窗口上传
    @image = File.new
    @image.image = params[:Filedata]
    @image.user_id = 1
    @image.save
    render :text => @image.image.url
  end
end