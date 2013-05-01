class Cpanel::ImagesController < Cpanel::ApplicationController

  def create
    # 浮动窗口上传
    @image = UploadFile.new
    @image.file_name = params[:Filedata]
    @image.user_id = 1
    @image.file_size = 10
    @image.type = 1 #图片
    @image.save
    render :text => @image.file_name.url
  end
end