# coding: utf-8
class Cpanel::NewsController < Cpanel::ApplicationController
  def index
    @news = News.paginate( :page => params[:page], :per_page => 15)
  end

  def new
  end

  def create
  end
end
