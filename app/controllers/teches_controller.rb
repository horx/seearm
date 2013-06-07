class TechesController < ApplicationController
  def index
    @on = 'news'
    @teches = Tech.paginate( :page => params[:page], :per_page => 20).all
    set_seo_meta("新闻动态","#{Setting.site_keywords}","#{Setting.site_desc}")
  end

  def show
    @on = 'news'
    @tech = Tech.find(params[:id])
    render_404 if @tech.nil?
    set_seo_meta("新闻动态 | #{@tech.name} | #{@tech.category.name} ","#{@tech.name},#{@tech.category.name},#{Setting.site_keywords}","#{@tech.name},#{@tech.category.name},#{Setting.site_desc}")
  end
end
