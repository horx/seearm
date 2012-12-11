# coding: utf-8
class CategoriesController < ApplicationController
  #before_filter :find_cat, :only => [:show]
  def show
  	@cat = Category.where(:slug => params[:id])
    render_404 if @cat.nil?
  end

  protected
  def find_cat
    # 处理有大写字母的情况
    if params[:id] != params[:id].downcase
      redirect_to request.path.downcase, :status => 301
      return
    end
    @cat = Category.where(:slug => /^#{params[:id]}$/i)
    render_404 if @cat.nil?
  end
end