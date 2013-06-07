# coding: utf-8
class Cpanel::NewsController < Cpanel::ApplicationController
  before_filter :find_news, :only => [ :edit, :update, :destroy]
  def index
    @news = News.paginate( :page => params[:page], :per_page => 15)
  end
  def new
    @news = News.new
  end

  def create
    @news = News.new(params[:news])
    if @news.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    flash[:notice] = "新闻建成功"
  end

  def edit
  end

  def update
    if @news.update_attributes(params[:news])
      redirect_to cpanel_news_index_path
    else
      render :action => :edit
    end
    flash[:notice] = "新闻更新成功"
  end

  def destroy
    @news.destroy
    redirect_to :action => :index
    flash[:alert] = "新闻已被删除"
  end

  private
  def find_news
    @news = News.find(params[:id])
  end
end
