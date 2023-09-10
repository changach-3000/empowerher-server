class UsersController < ApplicationController
    skip_before_action :authorize
    # before_action :set_user, only: [:show, :update, :destroy] # Add this line to ensure @user is set for these actions
  
    def index
      @users = User.all 
      render json: @users, status: :ok
    end
  

    def show
      render json: @user, status: :ok
    end


    def current_user 
      user = User.find_by(id: session[:user_id])

      if user
        render json: user, status: :ok
        
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end

  end
    
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      unless @user.update(user_params)
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
    end
  
    private
  
    def user_params
      params.permit(:username,:password)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
  end