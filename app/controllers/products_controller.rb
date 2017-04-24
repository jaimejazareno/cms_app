class ProductsController < ApplicationController
  before_action :set_products, only: [:show,:edit,:update,:destroy]
  before_action :signed_in_user
  before_action :correct_user,   only: [:edit, :update,:destroy]


  def index
    @products = Product.paginate(page: params[:page])
  end

  def show
    @name=@product.name
  end

  def new
    @product=Product.new
    @categories = Category.where(is_active:true)
  end

  def create
   
    @product=Product.new(product_params)
   
    params[:product][:categories].each do |f| 
      next if f == ''
        @product.categorizations.build(category_id:f)
    end
    
    if @product.save 
      redirect_to products_path
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if params[:product][:categories].first == '' && params[:product][:categories].last == ''
      @product.errors[:categories] = "Please select at least one category"
      render 'edit'
    else
      if @product.update_attributes(product_params)
        params[:product][:categories].each do |f|
          next if f == '' 
            @product.categorizations.build(category_id:f) 
          end
        redirect_to @product
      else
        render 'edit'
      end
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product deleted."
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name,:price)
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user) || current_user.admin
  end

  def set_products
    @product = Product.find(params[:id])
  end

end
