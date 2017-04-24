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
    i=0
    params[:product][:categories].each do |f| 
      @product.categorizations.build(product_id:@product.id,category_id:f)
      if f==''

      else
        i+=1
      end
      @product.categories= @product.id
    end
    
    if @product.save && i!=0
      redirect_to products_path
    else
      if i==0
        @product.errors[:categories] = "Please select one category"
        render 'new'

      else
        render 'new'
      end
      
    end

  end

  def edit

  end

  def update
    Categorization.where(product_id:@product).destroy_all
    i=0
    params[:product][:categories].each do |f| 
      @product.categorizations.build(product_id:@product.id,category_id:f) 
      if f==''

      else
        i+=1
      end
    end

    if @product.update_attributes(product_params2)&& i!=0
      redirect_to @product
    else
      if i==0
        @product.errors[:categories] = "Please select one category"
        render 'edit'

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
    params.require(:product).permit(:name,:price,categories:[])
  end

  def product_params2
    params.require(:product).permit(:name,:price)
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user) || current_user.admin
  end

  def set_products
    @product = Product.find(params[:id])
  end

end
