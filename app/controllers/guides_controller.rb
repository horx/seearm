# coding: utf-8
class GuidesController < ApplicationController
  def index
    @on = 'guide'
    @guides = Guide.paginate( :page => params[:page], :per_page => 20).all
    set_seo_meta("选购指南|#{Setting.site_name}","#{Setting.site_keywords}","#{Setting.site_desc}")
    fresh_when(:etag => [@guides])
  end

  def show
    @on = 'guide'
    @guide = Guide.find(params[:id])
    render_404 if @guide.nil?
    set_seo_meta("#{@guide.name}-#{@guide.category.name}|#{Setting.site_name}","#{@guide.name},#{@guide.category.name},#{Setting.site_keywords}","#{@guide.name},#{@guide.category.name},#{Setting.site_desc}")
    fresh_when(:etag => [@guide])
  end
end
