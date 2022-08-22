class UsersController < ApplicationController
    # skip_before_action :authenticate_request

    # GET /users or /users.json
    def index
      @user = User.all
      render json: @user
    end
  
    # GET /users/1 or /users/1.json
    def show; end
  
    # POST /users or /users.json
    def create

      @user = User.new(user_params)
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    private

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:name, :email, :age, :phone)
    end  

end
