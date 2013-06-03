# coding: utf-8
class Cpanel::PagesController < Cpanel::ApplicationController
  def index
    @pages = Page.paginate( :page => params[:page], :per_page => 15 )
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    flash[:notice] = "页面创建成功"
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:position])
      redirect_to cpanel_pages_path
    else
      render :action => :edit
    end
    flash[:notice] = "页面更新成功"
  end

  def destroy
    @page.destroy
    redirect_to :action => :index
    flash[:alert] = "页面已被删除"
  end
end
