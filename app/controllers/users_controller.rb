# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy edit update]

  def index
    @users = User.order(:name)
    if params[:show_inactive]
      @show_inactive = true
    else @users = @users.active
    end
  end

  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to users_url
    else 
      flash.now[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User successfully updated'
      redirect_to users_url
    else
      flash.now[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'User was successfully destroyed.'
      redirect_to users_url
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to users_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if @current_user.admin?
      params.require(:user).permit(:name, :spire, :active, :admin)
    else
      params.require(:user).permit(:name, :spire)
    end
  end
end
