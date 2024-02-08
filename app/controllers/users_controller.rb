class UsersController < ApplicationController

   before_action :set_user, only: %i[ show destroy ]

  def new
    @user = User.create({name: params[:name], password:params[:password], password_confirmation: params[:p]})
    @user
  end

  def show
    @user = User.all
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
    puts "params log", params
     @user = User.new({name: params[:name], password:params[:password], password_confirmation: params[:password]})
     if @user.save
      render json: @user, status: :created,  location: @user
     else
      render json: @user.error, status: :unprocessable_entity
     end

  end

  def destroy
    puts params
     @user.destroy
    render json: @user, status: 200

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    p "calling set user callback"

     @user=User.find(params[:id])
  end
end
