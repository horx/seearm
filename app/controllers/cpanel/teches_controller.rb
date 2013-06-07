class Cpanel::TechesController < Cpanel::ApplicationController
  before_filter :find_tech, :only => [ :edit, :update, :destroy]
  def index
    @teches = Tech.paginate( :page => params[:page], :per_page => 15 )
  end

  def new
    @tech = Tech.new
  end

  def create
    @tech = Tech.new(params[:tech])
    if @tech.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    flash[:notice] = "资料创建成功"
  end

  def edit
  end

  def update
    if @tech.update_attributes(params[:tech])
      redirect_to cpanel_teches_path
    else
      render :action => :edit
    end
    flash[:notice] = "资料更新成功"
  end

  def destroy
    @tech.destroy
    redirect_to :action => :index
    flash[:alert] = "资料已被删除"
  end

  private
  def find_tech
    @tech = Tech.find(params[:id])
  end
end
