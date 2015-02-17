class UsersController < ApplicationController
  before_action :set_user, 
                 only: [
                  :show,
                  :edit,
                  :update,
                  :destroy,
                ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: "User sucessfully created."}
      else
        format.html {render action: "new"}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: "User was successfuly updated."}
      else
        format.html {render action: "edit"}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url}
    end
  end

  def signin
    @user = User.new
    render action: "signin"
  end

  def signin_attempt
    if params[:password] == @user.password
      redirect_to user_tattoos_path
    else
      render action: "signin"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user) .permit(:user_name, :email, :password)
  end
end
