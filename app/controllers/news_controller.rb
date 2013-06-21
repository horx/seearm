# coding: utf-8
class NewsController < ApplicationController
  def index
    @on = 'news'
    @news = News.paginate( :page => params[:page], :per_page => 20).all
    set_seo_meta("新闻动态|#{Setting.site_name}","新闻动态,#{Setting.site_keywords}","#{Setting.site_desc}")
    fresh_when(:etag => [@news])
  end

  def show
    @on = 'news'
    @news = News.find(params[:id])
    render_404 if @news.nil?
    set_seo_meta("#{@news.name}-#{@news.category.name}|新闻动态|#{Setting.site_name}","#{@news.name},#{@news.category.name},#{Setting.site_keywords}","#{@news.name},#{@news.category.name},#{Setting.site_desc}")
    fresh_when(:etag => [@news])
  end
end
