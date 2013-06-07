# coding: utf-8
class Cpanel::GuidesController < Cpanel::ApplicationController
  before_filter :find_guide, :only => [ :edit, :update, :destroy]
  def index
    @guides = Guide.paginate( :page => params[:page], :per_page => 15 )
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    if @guide.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    flash[:notice] = "指南创建成功"
  end

  def edit
  end

  def update
    if @guide.update_attributes(params[:guide])
      redirect_to cpanel_guides_path
    else
      render :action => :edit
    end
    flash[:notice] = "指南更新成功"
  end

  def destroy
    @guide.destroy
    redirect_to :action => :index
    flash[:alert] = "指南已被删除"
  end

  private
  def find_guide
    @guide = Guide.find(params[:id])
  end
end