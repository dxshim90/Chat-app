class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all

    render json: users
  end

  def show
    render json: user
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: {error: "User was not created"}, status: 400
    end
  end

  def update
    if user.update(user_params)
      render json: user
    else
      render json: {error: "User was not updated."}, status: 451
    end
  end

  def destroy
    user.destroy
  end

  private
  
    def set_user
      user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
