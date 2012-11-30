class Cpanel::CategoriesController < Cpanel::ApplicationController
  before_filter :find_category, :only => [ :edit, :update, :destroy]
  def index
  	@categories = Category.paginate( :page => params[:page], :per_page => 15)
  end

  def new
  	@category = Category.new
  end

  def edit
  end

  def update
  	if @category.update_attributes(params[:category])
      redirect_to(cpanel_categories_path, :notice => 'Update Category Successfully.')
  	else
  	  render :action => :edit
  	end
  end

  def create
  	@category = Category.new(params[:category])

  	if @category.save
  	  redirect_to(cpanel_categories_path, :notice => 'Create Category Successfully.')
  	else
  	  render :action => :new
  	end
  end

  def destroy
  	@category.destroy
    redirect_to(cpanel_categories_path, :notice => 'Delete Category Successfully.')
  end

  protected
  def find_category
  	@category = Category.find(params[:id])  	
  end
end
