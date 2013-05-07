# coding: utf-8
class ProductsController < ApplicationController

  #产品分类
  def index
    @categories = Category.find_all_by_ctype(1)
  end
  def cat
  	@cats = Category.find_by_slug(params[:slug])
  end
  def show
    @product = Product.find(params[:id])
  end
end