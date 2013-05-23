# coding: utf-8
class Cpanel::ProductsController < Cpanel::ApplicationController
  before_filter :find_product, :only => [ :edit, :update, :destroy]

  delegate "markdown", :to => "ActionController::Base.helpers"

  def index
  	@products = Product.paginate( :page => params[:page], :per_page => 15 )
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.content_html = markdown @product.content
    if @product.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    flash[:notice] = "product was successfully created"
  end

  def edit
  end
  def update
    @product = params[:product]
    @product.content_html = markdown @product.content
    if @product.update_attributes(params[:product])
      redirect_to cpanel_products_path
    else
      render :action => :edit
    end
    flash[:notice] = "product was successfully updated"
  end

  def destroy
    @product.destroy
    redirect_to :action => :index
    flash[:alert] = "product was successfully deleted"
  end

  private
  def find_product
    @product = Product.find(params[:id])
    @product.content = ReverseMarkdown.parse @product.content
  end
end