class TechesController < ApplicationController
  def index
    @on = 'news'
    @teches = Tech.paginate( :page => params[:page], :per_page => 20).all
    set_seo_meta("资料文库|#{Setting.site_name}","资料文库,#{Setting.site_keywords}","#{Setting.site_desc}")
  end

  def show
    @on = 'news'
    @tech = Tech.find(params[:id])
    render_404 if @tech.nil?
    set_seo_meta("#{@tech.name}-#{@tech.category.name}|#{Setting.site_name}","#{@tech.name},#{@tech.category.name},#{Setting.site_keywords}","#{@tech.name},#{@tech.category.name},#{Setting.site_desc}")
  end
end
