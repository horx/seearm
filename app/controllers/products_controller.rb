# coding: utf-8
class ProductsController < ApplicationController

  #产品分类
  def index
    @on = 'products'
    @products = Product.paginate( :page => params[:page], :per_page => 6).all
    set_seo_meta("产品中心|所有产品|#{Setting.site_name}","产品中心,#{Setting.site_keywords}","#{Setting.site_desc}")
  end

  def show
    @on = 'products'
    @product = Product.find(params[:id])
    render_404 if @product.nil?
    set_seo_meta("#{@product.name}-#{@product.category.name}|产品中心|#{Setting.site_name}","#{@product.name},#{@product.category.name},#{Setting.site_keywords}","#{@product.name},#{@product.category.name},#{Setting.site_desc}")
  end

end