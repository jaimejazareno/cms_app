class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update,:make_admin,:destroy]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  
  def new
  	@user = User.new
  end

  def index
    @users = User.paginate(page: params[:page],:per_page =>10)  
  end

  def create
    @user=User.new(user_params)
    
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to FAKE STORE!"
      session[:username]= @user.username
      redirect_to @user
    else
      	render 'new'
    end

  end

  def show

  end

  def edit
    
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def make_admin
    @user.skip_pass_validation=true
    @user.admin=true
    @user.save
    flash[:success] = "Made a new admin"
    redirect_to users_path
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:fname,:lname,:email,:password,:username,:password_confirmation,:avatar)
    end

    def correct_user
      redirect_to(root_url) unless current_user?(@user) || current_user.admin
    end

    def set_user
      @user = User.find(params[:id])
      @username = @user.username
    end

end
