# coding: utf-8
class ProductsController < ApplicationController

  #产品分类
  def index
  	@categories = Category.all
  end
  def cat
  	@cats = Category.find_by_slug(params[:slug])
  end
  def show
    @product = Product.find(params[:id])
    @pictures = @product.pictures;

  end
end