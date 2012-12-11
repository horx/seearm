# coding: utf-8
class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show]
  def show
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