# coding: utf-8
class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show]

  def index
    @on = 'products'
    redirect_to products_lists_path, :status => 301
  end

  def show
    @on = 'products'
    find_category
    if (@category.parent_id == 0)
      cat_ids = Category.where(:parent_id => @category.id).map { |i| [i.id] }
    else
      cat_ids =[@category.id]
    end

    @products = Product.paginate( :page => params[:page], :per_page => 6).where(:category_id => cat_ids)
  end

  protected
  def find_category
    # 处理有大写字母的情况
    if params[:id] != params[:id].downcase
      redirect_to request.path.downcase, :status => 301
      return
    end
    @category = Category.where(:slug => params[:id]).first
    render_404 if @category.nil?
  end

end