# coding: utf-8
class ProductsController < ApplicationController

  #产品分类
  def index
    @on = 'products'
    @products = Product.paginate( :page => params[:page], :per_page => 6).all
  end

  def show
    @on = 'products'
    @product = Product.find(params[:id])
    render_404 if @product.nil?
  end

end