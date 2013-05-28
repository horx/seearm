# coding: utf-8
class ProductsController < ApplicationController

  #产品分类
  def index
    @on = 'products'
    @categories = Category.all
  end
  def cat
    @on = 'products'
  	@cats = Category.find_by_slug(params[:slug])
  end
  def show
    @on = 'products'
    @product = Product.find(params[:id])
  end
end