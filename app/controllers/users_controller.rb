class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = 'The user was successfully created.' if @user.save
    flash[:error] = @user.errors.full_messages.join(", ")
    redirect_to action: 'index'
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    flash[:notice] = 'The user was successfully updated.' if @user.update(user_params)
    flash[:error] = @user.errors.full_messages.join(", ")
    redirect_to action: 'index'
  end

  def destroy
    flash[:notice] = 'The user was successfully destroyed.' if @user.destroy
    respond_with(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :name, :email, :password, :admin)
    end
end
