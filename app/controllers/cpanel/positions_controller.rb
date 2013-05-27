# coding: utf-8
class Cpanel::PositionsController < Cpanel::ApplicationController
    before_filter :find_position, :only => [ :edit, :update, :destroy]

    def index
      @positions = Position.paginate( :page => params[:page], :per_page => 15 )
    end

    def new
      @product = Position.new
    end

    def create
      @position = Position.new(params[:position])
      if @position.save
        redirect_to :action => :index
      else
        render :action => :new
      end
      flash[:notice] = "推荐内存创建成功"
    end

    def edit
    end

    def update
      if @position.update_attributes(params[:position])
        redirect_to cpanel_positions_path
      else
        render :action => :edit
      end
      flash[:notice] = "推荐内容更新成功"
    end

    def destroy
      @position.destroy
      redirect_to :action => :index
      flash[:alert] = "推荐内容已被删除"
    end

    private
    def find_position
      @position = Position.find(params[:id])
    end

end
